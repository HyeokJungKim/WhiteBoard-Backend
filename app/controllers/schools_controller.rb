class SchoolsController < ApplicationController
  def index
    @schools = School.all()
    render json: @schools, include: '**'
  end

  def create
    @school = School.new(school_params)
    byebug
    if(@school.save)
      render json: {valid: true}
    else
      render json: {errors: @school.errors.full_messages}
    end
  end

  def validateSchool
    @school = School.find(params[:id])
    if(@school.authenticate(params[:schoolPassword]))
      render json: {valid: true}
    else
      render json: {valid: false}
    end

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
    params.permit(:name, :password)
  end

end
