class StudentsController < ApplicationController
  
  def create
    @student = Student.new(student_params)
    if(@student.save)
      render json: tokenForAccount(@student)
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
    params.permit(:firstName, :lastName ,:username, :password)
  end

end
