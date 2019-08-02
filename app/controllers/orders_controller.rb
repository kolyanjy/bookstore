class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Orders::Sort.call(status: params[:sort], user: current_user).orders.decorate
  end

  def show
    @order = Order.find_by!(user_id: current_user.id, id: params[:id]).decorate
  end
end
