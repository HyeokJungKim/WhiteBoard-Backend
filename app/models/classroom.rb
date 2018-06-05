class Classroom < ApplicationRecord
  has_secure_password

  has_many :schedules
  has_many :students, through: :schedules
  belongs_to :teacher
  has_many :assignments

  validates :name, presence: true
end
