class Grade < ApplicationRecord
  belongs_to :assignment

  validates :grade, presence: true
end
