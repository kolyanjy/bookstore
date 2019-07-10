class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  validates :first_name, presence: true, length: { in: 2..50 }
  validates :last_name, presence: true, length: { in: 2..50 }
  validates :address, presence: true, length: { in: 2..100 }
  validates :city, presence: true, length: { in: 2..50 }
  validates :zip, presence: true, length: { in: 1..9 }, format: { with: /\A[^!@#%^&|]+\z/}
  validates :country, presence: true, length: { in: 2..50 }
  validates :phone, presence: true, length: { in: 10..12 }, format: { with: /\A[0-9]+\z/ }
end
