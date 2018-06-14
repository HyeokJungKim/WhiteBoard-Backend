class GradesController < ApplicationController

  def show
    @grade = Grade.find(params[:id])
    render json: @grade
  end

  def update
    @grade = Grade.find(params[:id])
    if @grade.update(grade: params[:grade].to_i)
      @classroom = @grade.assignment.classroom
      @grade.save
      render json: @classroom, include: '**'
    else
      render json: {errors: @grade.errors.full_messages}
    end
  end

end
