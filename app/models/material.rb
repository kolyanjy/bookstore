class Material < ApplicationRecord
  has_many :books, through: :book_materials
  has_many :book_materials, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
