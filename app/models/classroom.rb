class Classroom < ApplicationRecord
  has_many :schedules
  has_many :students, through: :schedules
  belongs_to :teacher
  has_many :assignments
end
