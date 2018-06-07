class ClassroomsController < ApplicationController
  def students
    @classroom = Classroom.find(params[:id])
    @assignments = @classroom.assignments
    @students = @classroom.students
    @studentsWithGrades = @students.map do |student|
    end
    render json: @students.to_json(:only => [:id, :firstName, :lastName], :include => [:grades, :assignments])
  end

end
