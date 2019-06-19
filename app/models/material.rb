class Material < ApplicationRecord
  belongs_to :book, optional: true

  validates :name, presence: true, uniqueness: true
end
