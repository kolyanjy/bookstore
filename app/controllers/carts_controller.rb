class CartsController < ApplicationController
  include CheckoutConcern

  def show
    @order_items = current_order.order_items.decorate
  end

  def checkout
    return redirect_to books_path, flash: { danger: t('order.add_to_cart') } if current_order.order_items.empty?

    current_order.filling_address! if current_order.cart?
    redirect_to checkout_step_path
  end
end
