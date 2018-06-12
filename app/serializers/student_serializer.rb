class StudentSerializer < ActiveModel::Serializer
  attributes :id, :firstName, :lastName, :username, :isAccount
  has_many :grades, if: -> {!isStudent?}

  has_many :classrooms, if: -> {isStudent?}

  def isStudent?
    if scope
      return scope[:student]
    else
      return false
    end
  end

end
