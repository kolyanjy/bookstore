module Checkout
  class FillCompletesController < ApplicationController
    include CheckoutConcern

    def show
      @order = current_user.orders.find_by!(number: params[:number]).decorate
      @order_items = @order.order_items.decorate
    end
  end
end
