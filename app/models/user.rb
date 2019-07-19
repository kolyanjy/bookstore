class User < ApplicationRecord
  devise :database_authenticatable, :confirmable,
         :registerable, :recoverable, :rememberable,
         :validatable, :omniauthable, omniauth_providers: %i[facebook]

  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :orders, dependent: :destroy

  has_one :billing_address, as: :addressable, dependent: :destroy
  has_one :shipping_address, as: :addressable, dependent: :destroy

  accepts_nested_attributes_for :shipping_address, :billing_address, update_only: true
end
