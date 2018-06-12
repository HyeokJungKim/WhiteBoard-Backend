class Student < ApplicationRecord
  has_secure_password validations: false

  has_many :schedules, dependent: :delete_all
  has_many :classrooms, through: :schedules
  has_many :teachers, through: :classrooms
  has_many :assignments, through: :classrooms
  has_many :grades

  validates :firstName, presence: true
  validates :lastName, presence: true
  validates :username, presence: true, uniqueness: true, :if => :is_account?
  validates :password, presence: true, :if => :is_account?

  def is_account?
    self.is_account
  end

end
