module Coupons
  class Add
    include Interactor
    def call
      coupon = Coupon.find_by(key: context.key)
      context.fail! unless coupon && context.order.update(coupon_id: coupon.id)
    end
  end
end
