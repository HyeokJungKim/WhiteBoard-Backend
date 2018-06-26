class Assignment < ApplicationRecord
  belongs_to :classroom
  has_attached_file :pdf
  has_many :grades, dependent: :delete_all

  validates :description, presence: true, length: { maximum: 120 }
  validates_attachment_content_type :pdf, :content_type =>['application/pdf']
end
