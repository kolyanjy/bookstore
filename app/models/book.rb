class Book < ApplicationRecord
  belongs_to :category
  has_many :book_materials, dependent: :destroy
  has_many :materials, through: :book_materials
  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors

  validates :name, presence: true, length: { in: 0..50 }
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal: 0, less_than_or_equal: 10_000 }
  mount_uploader :image, ImageUploader
end
