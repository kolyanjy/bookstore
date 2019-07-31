class Order < ApplicationRecord
  include AASM
  STEPS = %i[fill_address fill_delivery fill_payment fill_confirm fill_complete]
  FINISH_STATUSES = %i[in_progress in_delivery delivered canceled].freeze

  belongs_to :user, optional: true
  belongs_to :delivery, optional: true, validate: true
  belongs_to :coupon, optional: true

  has_many :order_items, dependent: :destroy
  has_many :addresses, as: :addressable, dependent: :destroy

  has_one :billing_address, as: :addressable, dependent: :destroy
  has_one :shipping_address, as: :addressable, dependent: :destroy
  has_one :payment, dependent: :destroy

  accepts_nested_attributes_for :shipping_address, :billing_address, update_only: true

  enum status: {
    cart: 0,
    fill_address: 1,
    fill_delivery: 2,
    fill_payment: 3,
    fill_confirm: 4,
    in_progress: 5,
    in_delivery: 6,
    delivered: 7,
    canceled: 8
  }

  aasm :status, enum: true do
    state :cart, initial: true
    state :fill_address
    state :fill_delivery
    state :fill_payment
    state :fill_confirm
    state :fill_complete
    state :in_progress
    state :in_delivery
    state :delivered
    state :canceled

    event :filling_address do
      transitions from: :cart, to: :fill_address
    end

    event :filling_delivering do
      transitions from: :fill_address, to: :fill_delivery
    end

    event :filling_payments do
      transitions from: :fill_delivery, to: :fill_payment
    end

    event :filling_confirm do
      transitions from: :fill_payment, to: :fill_confirm
    end

    event :confirm do
      transitions from: :fill_confirm, to: :in_progress
    end

    event :deliver do
      transitions from: :in_progress, to: :in_delivery
    end

    event :confirm_delivery do
      transitions from: :in_delivery, to: :delivered
    end

    event :cancel do
      transitions from: %i[in_progress in_delivery delivered], to: :canceled
    end
  end
end
