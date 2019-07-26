module Checkout
  class FillPaymentsController < ApplicationController

    def show
      if !Checkout::CheckPermission.call(allowed_status: 3, order: current_order).success?
        redirect_to public_send('checkout_' + current_order.status + '_path') and return
      end
      @payment = Delivery.all
    end

    def create
      
    end
  end
end
