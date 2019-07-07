class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  validates :first_name, presence: true, length: { in: 2..50 }
  validates :last_name, presence: true, length: { in: 2..50 }
  validates :address, presence: true, length: { in: 2..100 }
  validates :city, presence: true, length: { in: 0..50 }
  validates :zip, presence: true, numericality: { greater_than_or_equal: 2, less_than_or_equal: 4 }
  validates :country, presence: true, length: { in: 0..50 }
  validates :phone, presence: true, numericality: { greater_than_or_equal: 8, less_than_or_equal: 12 }
end
