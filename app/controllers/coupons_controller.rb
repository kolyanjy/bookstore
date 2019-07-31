class CouponsController < ApplicationController
  def update
    coupon = Coupon.find_by(key: params[:coupon][:key])
    if coupon
      current_order.update(coupon_id: coupon.id)
      flash[:success] = t('coupon.success_update')
    else
      flash[:danger] = t('coupon.not_found')
    end
    redirect_to cart_path
  end
end
