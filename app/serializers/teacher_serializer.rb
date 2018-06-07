class TeacherSerializer < ActiveModel::Serializer
  attributes :id, :firstName, :lastName :username
  has_many :classrooms
end
