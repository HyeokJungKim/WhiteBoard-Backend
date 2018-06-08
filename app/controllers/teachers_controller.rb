class TeachersController < ApplicationController

  def show
    @teacher = Teacher.find(params[:id])
    if(@teacher && authorized?(@teacher))
      render json: {isTeacher: true}
    else
      render json: {isTeacher: false}
    end
  end

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
      @students = @classrooms.map {|classroom| classroom.students}
      @classrooms = JSON.parse(@classrooms.to_json(only: [:id,:name], :include => [:assignments]))
      @students = JSON.parse(@students.to_json(only: [:id, :firstName, :lastName], :include => [:grades]))
      @students.each do |students|
        students.each do|student|
          student["grades"].sort_by{|grade| grade["assignment_id"]}
        end
      end
      @classrooms.each_with_index do |classroom, index|
        classroom["students"] = @students[index]
        classroom["assignments"].sort_by{|assignment| assignment["id"]}
      end
      render json:{classrooms: @classrooms}
    else
      render json: {errors: "You do not have access to view this page."}
    end
  end

  private
  def teacher_params
    params.permit(:firstName, :lastName ,:username, :password)
  end
end
