class SchoolsController < ApplicationController
  def index
    @schools = School.all()
    render json: @schools, include: '**'
  end

  def getStudents
    @school = School.find(params[:id])
    if(@school.authenticate(params[:password]))
      @students = @school.students
      render json: @students.uniq
    else
      render json: {error: "You have entered the incorrect password"}
    end
  end

  private
  def school_params
    params.permit(:name)
  end

end
