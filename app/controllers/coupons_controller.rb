class CouponsController < ApplicationController
<<<<<<< HEAD
=======
  # TODO: remove this controller in the next pull request
>>>>>>> develop
  def update
    result = Coupons::Add.call(key: params[:coupon][:key], order: current_order)
    if result.success?
      flash[:success] = t('coupon.success_update')
    else
      flash[:danger] = t('coupon.not_found')
    end
    redirect_to cart_path
  end
end
