class AssignmentsController < ApplicationController

  def show
    @assignment = Assignment.find(params[:id])
    render json: @assignment
  end

  def update
    @assignment = Assignment.find(params[:id])
    @assignment.pdf = params[:pdf]
    if(@assignment.save)
      @classroom = @assignment.classroom
      render json: @classroom, include: '**'
    else
      render json: {error: "Invalid file type."}
    end
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    @classroom = @assignment.classroom
    if(@assignment.destroy)
      render json: @classroom, include: '**'
    else
      render json: {error: "Could not delete assignment."}
    end
  end

  def updateAssignment
    @assignment = Assignment.find(params[:id])
    @assignment.update(description: params[:description])
    if(@assignment.save)
      @classroom = @assignment.classroom
      render json: @classroom, include: '**'
    else
      render json: {error: "Must include a valid description."}
    end
  end

  def removePDF
    @assignment = Assignment.find(params[:id])
    @assignment.pdf = nil
    if(@assignment.save)
      @classroom = @assignment.classroom
      render json: @classroom, include: '**'
    else
      render json: {error: "Invalid file type."}
    end
  end

  private
  def assignment_params
    params.permit(:pdf)
  end

end
