class Grade < ApplicationRecord
  belongs_to :assignment
  belongs_to :student

  validates_numericality_of :grade, :only_integer => true,
    :greater_than_or_equal_to => 0,
    :less_than_or_equal_to => 100,
    :message => "Grade can only be between 0 and 100"
end
