module Checkout
  class FillCompletesController < ApplicationController
    def show
      if !Checkout::CheckPermission.call(allowed_status: :fill_complete, order: current_order).success?
        redirect_to public_send('checkout_' + current_order.status + '_path') and return
      end
      @order = current_order
      current_order.in_progress!
      session[:order_id] = nil
    end

    def create
      current_order.fill_complete!
      redirect_to public_send('checkout_' + current_order.status + '_path')
    end
  end
end
