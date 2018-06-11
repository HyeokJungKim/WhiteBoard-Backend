class ClassroomSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :assignments
  has_many :students, if: -> {!isStudent?}

  belongs_to :teacher, if: -> {isStudent?}
  
  def isStudent?
    if scope
      return scope[:student]
    else
      return false
    end
  end

end
