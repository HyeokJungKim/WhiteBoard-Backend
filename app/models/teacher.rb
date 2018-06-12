class Teacher < ApplicationRecord
  has_secure_password

  belongs_to :school
  has_many :classrooms
  has_many :students, through: :classrooms
  has_many :assignments, through: :classrooms

  validates :firstName, presence: true
  validates :lastName, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

end
