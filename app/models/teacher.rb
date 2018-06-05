class Teacher < ApplicationRecord
  has_secure_password

  has_many :classrooms
  has_many :students, through: :classrooms
  has_many :assignments, through: :classrooms

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

end
