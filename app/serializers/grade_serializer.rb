class GradeSerializer < ActiveModel::Serializer
  attributes :id, :grade, :student_id, :assignment_id

end
