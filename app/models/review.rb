class Review < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  validates :title, presence: true, length: { maximum: 30 }
  validates :comment, presence: true, length: { maximum: 300 }
end
