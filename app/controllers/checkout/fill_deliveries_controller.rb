module Checkout
  class FillDeliveriesController < ApplicationController

    def show
      if !Checkout::CheckPermission.call(allowed_status: 2, order: current_order).success?
        redirect_to public_send('checkout_' + current_order.status + '_path') and return
      end
      @deliveries = Delivery.all
    end

    def create

      binding.pry
    end
  end
end
