class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :description, :pdf
  has_many :grades, if: -> {isStudent?}

  def pdf
    object.pdf.path if object.pdf.present?
  end

  def isStudent?
    if scope
      return scope[:student]
    else
      return false
    end
  end



end
