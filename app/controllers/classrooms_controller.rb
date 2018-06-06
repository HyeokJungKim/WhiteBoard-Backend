class ClassroomsController < ApplicationController

  def classAndAssignmentsForTeacher
    @teacher = Teacher.find(params[:id])
    @classrooms = @teacher.classrooms
    @assignments = @teacher.assignments
    @safeClassRooms = @classrooms.to_json(only: [:id,:name])
    render json: {classrooms: JSON.parse(@safeClassRooms), assignments: @assignments}
  end
end
