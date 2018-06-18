class StudentsController < ApplicationController
  
  def show
    @student = Student.find(params[:id])
    render json: @student, include: '**', scope: {'student': true}
  end

  def create
    @student = Student.new(student_params)
    randomVar = Sysrandom.hex(3)
    @student.username = "#{@student.firstName}#{@student.lastName}#{randomVar}"
    @student.password = randomVar
    if(@student.save)
      @classroom = Classroom.find(params["class_id"])
      Schedule.create(student: @student, classroom: @classroom)
      @classroom.assignments.each do |assignment|
        Grade.create(grade: 0, student: @student, assignment: assignment)
      end
      @classroom.save
      render json: @classroom, include: '**'
    else
      render json: {errors: @student.errors.full_messages}
    end
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_update)
    @student.update(isAccount: true)
    if(@student.save)
      render json: @student, include: '**', scope: {'student': true}
    else
      render json: {errors: @student.errors.full_messages}
    end
  end

  def login
    @student = Student.find_by(username: params[:username])
    if(@student && @student.authenticate(params[:password]))
      render json: tokenForAccount(@student)
    else
      render json: {error: "Invalid username or password."}
    end
  end

  def classesAndAssignments
    @student = Student.find(params[:id])
    if(authorized?(@student))
      render json: @student, include: '**', scope: {'student': true}
    else
      render json: {errors: "You do not have access to view this page."}
    end
  end


  private
  def student_params
    params.require(:student).permit(:firstName, :lastName)
  end

  def student_update
    params.permit(:username, :password)
  end

end
