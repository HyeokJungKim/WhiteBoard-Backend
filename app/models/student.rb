class Student < ApplicationRecord
  has_many :schedules
  has_many :classrooms, through: :schedules
  has_many :teachers, through: :classrooms
  has_many :assignments, through: :classrooms
  has_many :grades, through: :assignments
end
