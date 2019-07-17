class OrderItem < ApplicationRecord
  belongs_to :book
  belongs_to :order
  delegate :name, to: :book, prefix: true

  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
