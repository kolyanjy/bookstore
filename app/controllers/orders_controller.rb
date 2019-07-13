class OrdersController < ApplicationController

  def cart
    @order = current_order
  end

  def index
    @orders = Order.find_by(user_id: current_user.id, id: params[:id])
  end
end
