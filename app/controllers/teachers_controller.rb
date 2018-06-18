class TeachersController < ApplicationController

  def show
    @teacher = Teacher.find(params[:id])
    if(@teacher && isTeacher?)
      render json: {isTeacher: true}
    else
      render json: {isTeacher: false}
    end
  end

  def login
    @teacher = Teacher.find_by(username: params[:username])
    if(@teacher && @teacher.authenticate(params[:password]))
      render json: tokenForAccount(@teacher)
    else
      render json: {error: "Invalid username or password."}
    end
  end

  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.school = School.find(params[:schoolID])
    if(@teacher.save)
      render json: tokenForAccount(@teacher)
    else
      render json: {errors: @teacher.errors.full_messages}
    end
  end


  def classesAndAssignments
    @teacher = Teacher.find(params[:id])
    if(authorized?(@teacher))
      render json: @teacher, include: '**'
    else
      render json: {errors: "You do not have access to view this page."}
    end
  end

  private
  def teacher_params
    params.permit(:firstName, :lastName ,:username, :password)
  end
end
