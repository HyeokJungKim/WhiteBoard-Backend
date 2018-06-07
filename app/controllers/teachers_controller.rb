class TeachersController < ApplicationController

  def create
    @teacher = Teacher.new(teacher_params)
    if(@teacher.save)
      render json: tokenForAccount(@teacher)
    else
      render json: {errors: @teacher.errors.full_messages}
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

  def classesAndAssignments
    @teacher = Teacher.find(params[:id])
    if(authorized?(@teacher))
      @classrooms = @teacher.classrooms
      @assignments = @teacher.assignments
      @safeClassRooms = @classrooms.to_json(only: [:id,:name])
      render json: {classrooms: JSON.parse(@safeClassRooms), assignments: @assignments}
    else
      render json: {errors: "You do not have access to view this page."}
    end
  end

  private
  def teacher_params
    params.permit(:firstName, :lastName ,:username, :password)
  end
end
