class StudentsController < ApplicationController
  def create
    @student = Student.new(student_params)
    if(@student.save)
      render json: tokenForAccount(@student)
    else
      render json: {errors: @student.errors.full_messages}
    end
  end

  def login
    @student = Student.find_by(username: params[:username])
    if(@student && @student.authenticate(params[:password]))
      render json: tokenForAccount(@student)
    else
      render json: {error: "Invalid username or password."}
    end
  end

  def classesAndAssignments
    @student = Teacher.find(params[:id])
    if(authorized?(@student))
      @classrooms = @student.classrooms
      @teachers = @classrooms.map {|classroom| classroom.teachers}
      
      # @classrooms = JSON.parse(@classrooms.to_json(only: [:id,:name], :include => [:grades,:assignments]))
      # @teachers = JSON.parse(@teachers.to_json(only: [:id, :firstName, :lastName], :include => [:grades]))
      # @teachers.each do |teachers|
      #   teachers.each do|teacher|
      #     teacher["grades"].sort_by{|grade| grade["assignment_id"]}
      #   end
      # end
      # @classrooms.each_with_index do |classroom, index|
      #   classroom["teachers"] = @teachers[index]
      #   classroom["assignments"].sort_by{|assignment| assignment["id"]}
      # end
      render json:{classrooms: @classrooms}
    else
      render json: {errors: "You do not have access to view this page."}
    end
  end


  private
  def student_params
    params.permit(:firstName, :lastName ,:username, :password)
  end

end
