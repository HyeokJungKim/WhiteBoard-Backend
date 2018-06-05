class TeachersController < ApplicationController
  def create
    @teacher = Teacher.create(teacher_params)
    render json: @teacher
  end

  private
  def teacher_params
    params.permit(:name ,:username, :password)
  end
end
