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

  private
  def teacher_params
    params.permit(:firstName, :lastName ,:username, :password)
  end
end
