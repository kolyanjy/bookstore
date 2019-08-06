module Orders
  class AddCoupon
    include Interactor
    def call
      coupon = Coupon.find_by(key: context.key)
      context.fail! if !coupon || !context.order.update(coupon_id: coupon&.id)
    end
  end
end
