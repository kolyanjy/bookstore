class OrdersController < ApplicationController

  def cart
    @order = current_order
  end

end
