class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :add_coupon

  def index
    @orders = Orders::StatusQuery.new(current_user, params[:sort]).call.decorate
    @presenter = OrdersPresenter.new
  end

  def show
    @order = current_user.orders.find_by!(id: params[:id]).decorate
  end

  def add_coupon
    result = Orders::AddCoupon.call(key: params[:coupon][:key], order: current_order)
    if result.success?
      flash[:success] = t('coupon.success_update')
    else
      flash[:danger] = t('coupon.not_found')
    end
    redirect_to cart_path
  end
end
