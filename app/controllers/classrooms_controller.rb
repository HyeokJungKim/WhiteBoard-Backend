class ClassroomsController < ApplicationController

  def create
    @classroom = Classroom.create(class_params)
    @teacher = Teacher.find(params[:teacherID])
    @classroom.teacher = @teacher
    if(@classroom.save)
      render json: @teacher, include: '**'
    else
      render json: {error: "Name cannot be blank."}
    end
  end


  def assignments
    @classroom = Classroom.find(params[:id])
    @assignment = Assignment.new(description: params[:description], classroom: @classroom)
    if(@assignment.save)
      @students = @classroom.students
      @students.each do |student|
        Grade.create(grade: rand(100), student: student, assignment: @assignment)
        student.save
      end
      @classroom.save
      @teacher = @classroom.teacher
      render json: @classroom, include: '**'
    else
      render json: {error: "Must include a valid description."}
    end
  end

  def students
    @classroom = Classroom.find(params[:id])
    @studentIDs = params[:studentsArr]
    @studentIDs.each do |id|
      @student = Student.find(id)
      Schedule.create(student: @student, classroom: @classroom)
      @classroom.assignments.each do |assignment|
        Grade.create(grade: Faker::Number.between(0, 100), student: @student, assignment: assignment)
      end
      @classroom.save
    end
    render json: @classroom, include: '**'
  end

  def getGrades
    @classroom = Classroom.find(params[:id])
    render json: @classroom, include: '**', scope: {'student': true}
  end

  private
  def class_params
    params.permit(:name)
  end

end
