class Payment < ApplicationRecord
  belongs_to :order, dependent: :destroy

  validates :number, presence: true, length: { is: 16 }, format: { with: /\A[0-9]+\z/ }
  validates :cvv, presence: true, length: { in: 3..4 }
  validates :name, presence: true, length: { in: 1..50 }
  validates :date, presence: true, length: { in: 4..5 }
end
