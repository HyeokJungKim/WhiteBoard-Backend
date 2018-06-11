class TeacherSerializer < ActiveModel::Serializer
  attributes :id, :firstName, :lastName
  has_many :classrooms, if: -> {!isStudent?}

  def isStudent?
    if scope
      return scope[:student]
    else
      return false
    end
  end

end
