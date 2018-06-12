class School < ApplicationRecord
  has_many :teachers
  has_many :classrooms, through: :teachers
end
