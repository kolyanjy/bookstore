class OrderItem < ApplicationRecord
  belongs_to :book
  belongs_to :order

  delegate :price, to: :book, prefix: true

  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
