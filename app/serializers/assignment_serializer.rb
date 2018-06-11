class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :description
  has_many :grades, if: -> {isStudent?}

  def isStudent?
    if scope
      return scope[:student]
    else
      return false
    end
  end



end
