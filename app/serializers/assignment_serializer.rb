class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :description, :pdf
  has_many :grades, if: -> {isStudent?}

  def pdf
    if object.pdf.present?
      str = object.pdf.path
      return "https://gradebook-pdf.s3.us-east-2.amazonaws.com/#{str}"
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
