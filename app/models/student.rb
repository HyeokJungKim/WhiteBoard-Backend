class Student < ApplicationRecord
  has_secure_password validations: false

  has_many :schedules, dependent: :delete_all
  has_many :classrooms, through: :schedules
  has_many :teachers, through: :classrooms
  has_many :schools, through: :teachers
  has_many :assignments, through: :classrooms
  has_many :grades

  validates :firstName, presence: true, length: { maximum: 32 }
  validates :lastName, presence: true, length: { maximum: 32 }
  validates :username, presence: true, uniqueness: true, length: { maximum: 32 }, :if => :isAccount?
  validates :password, presence: true, :if => :isAccount?

  def isAccount?
    self.isAccount
  end

end
