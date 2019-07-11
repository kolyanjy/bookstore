class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :title, :mark, :description, presence: true
  validates :title, length: { in: 2..50 }
  validates :description, length: { in: 10..500 }
  validates :mark, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
