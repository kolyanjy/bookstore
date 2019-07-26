class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items.decorate
  end

  def checkout
    current_order.filling_address! if current_order.cart?
    redirect_to checkout_fill_address_path
  end
end
