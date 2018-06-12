class Student < ApplicationRecord
  has_secure_password validations: false

  has_many :schedules, dependent: :delete_all
  has_many :classrooms, through: :schedules
  has_many :teachers, through: :classrooms
  has_many :schools, through: :teachers
  has_many :assignments, through: :classrooms
  has_many :grades

  validates :firstName, presence: true
  validates :lastName, presence: true
  validates :username, presence: true, uniqueness: true, :if => :isAccount?
  validates :password, presence: true, :if => :isAccount?

  def isAccount?
    self.isAccount
  end

end
