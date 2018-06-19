class AssignmentsController < ApplicationController

  def update
    @assignment = Assignment.find(params[:id])
    @assignment.pdf = params[:pdf]
    if(@assignment.save)
      @classroom = @assignment.classroom
      render json: @classroom, include: '**'
    else
      render json:{error: "Invalid File Type!"}
    end
  end

  private
  def assignment_params
    params.permit(:pdf)
  end

end
