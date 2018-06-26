class Teacher < ApplicationRecord
  has_secure_password

  belongs_to :school
  has_many :classrooms
  has_many :students, through: :classrooms
  has_many :assignments, through: :classrooms

  validates :firstName, presence: true, length: { maximum: 32 }
  validates :lastName, presence: true, length: { maximum: 32 }
  validates :username, presence: true, uniqueness: true, length: { maximum: 32 }
  validates :password, presence: true

end
