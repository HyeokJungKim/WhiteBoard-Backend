class Classroom < ApplicationRecord

  has_many :schedules
  belongs_to :teacher
  delegate :school, :to => :teacher, :allow_nil => true

  has_many :students, through: :schedules
  has_many :assignments

  validates :name, presence: true, length: { maximum: 32 }
end
