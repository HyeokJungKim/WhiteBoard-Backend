class ClassroomsController < ApplicationController
  def assignments
    @classroom = Classroom.find(params[:id])
    @assignment = Assignment.new(description: params[:description], classroom: @classroom)
    if(@assignment.save)
      @students = @classroom.students
      @students.each do |student|
        Grade.create(grade: 0, student: student, assignment: @assignment)
        student.save
      end
      @classroom.save
      @teacher = @classroom.teacher
      render json: @teacher, include: '**'
    else
      render json: {errors: "Must include a valid description"}
    end
  end

end
