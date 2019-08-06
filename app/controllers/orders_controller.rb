class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :update

  def index
    @orders = Orders::Sort.call(status: params[:sort], user: current_user).orders.decorate
  end

  def show
    @order = Order.find_by!(user_id: current_user.id, id: params[:id]).decorate
  end

  def update
    result = Orders::AddCoupon.call(key: params[:coupon][:key], order: current_order)
    if result.success?
      flash[:success] = t('coupon.success_update')
    else
      flash[:danger] = t('coupon.not_found')
    end
    redirect_to cart_path
  end
end
