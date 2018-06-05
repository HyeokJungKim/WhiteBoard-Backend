class Assignment < ApplicationRecord
  belongs_to :classroom
  has_many :grades
end
