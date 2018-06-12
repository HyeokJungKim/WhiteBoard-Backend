class GradesController < ApplicationController

  def show
    @grade = Grade.find(params[:id])
    render json: @grade
  end

  def edit
    @grade = Grade.find(params[:id])
    # FIXME: ADD EDIT
  end

end
