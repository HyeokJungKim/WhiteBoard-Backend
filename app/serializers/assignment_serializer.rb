class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :description, :pdf
  has_many :grades, if: -> {isStudent?}

  def pdf
    if object.pdf.present?
      str = object.pdf.path.split('/public')[1]
      return "http://localhost:8000#{str}"
    end
  end

  def isStudent?
    if scope
      return scope[:student]
    else
      return false
    end
  end



end
