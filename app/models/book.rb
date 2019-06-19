class Book < ApplicationRecord
  belongs_to :category
  has_many :materials # rubocop:disable Rails/HasManyOrHasOneDependent
  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors
  has_many :book_images, dependent: :destroy

  validates :name, presence: true, length: { in: 0..50 }
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal: 0, less_than_or_equal: 10_000 }
  validates :date_of_publication, presence: true
end
