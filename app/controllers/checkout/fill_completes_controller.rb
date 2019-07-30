module Checkout
  class FillCompletesController < ApplicationController
    include CheckoutCheck
    def show
      unless check_step(:fill_complete, current_order)
        redirect_to public_send('checkout_' + current_order.status + '_path') and return
      end
      @order = current_order
      binding.pry
      current_order.in_progress!
      session[:order_id] = nil
    end

  end
end
