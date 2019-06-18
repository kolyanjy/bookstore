class Book < ApplicationRecord
  belongs_to :category
  belongs_to :material
  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors
  has_many :book_images, dependent: :destroy

  validates :name, presence: true, length: { in: 3..50 }
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal: 0, less_than_or_equal: 10_000 }
  validates :date_of_publication, presence: true
  validates :height, presence: true, numericality: { greater_than: 5, less_than: 1500 }
  validates :width, presence: true, numericality: { greater_than: 5, less_than: 1500 }
  validates :depth, presence: true, numericality: { greater_than: 5, less_than: 1500 }
end
