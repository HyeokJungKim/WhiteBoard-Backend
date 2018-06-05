class Assignment < ApplicationRecord
  belongs_to :classroom
  has_many :grades, dependent: :delete_all

  validates :description, presence: true
end
