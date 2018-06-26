class School < ApplicationRecord
  has_secure_password
  has_many :teachers
  has_many :classrooms, through: :teachers
  has_many :students, through: :classrooms

  validates :name, presence: true, uniqueness: true, length: { maximum: 32 }
end
