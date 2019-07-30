module Checkout
  class FillDeliveriesController < ApplicationController
    include CheckoutCheck

    def show
      unless check_step(:fill_delivery, current_order)
        redirect_to public_send('checkout_' + current_order.status + '_path') and return
      end
      @deliveries = Delivery.all.order(price: :asc)
    end

    def create
      Checkout::FillDelivery::Organizer.call(order: current_order,
         params: delivery_params, allowed_status: :fill_delivery)
      redirect_to public_send('checkout_' + current_order.status + '_path') and return
    end

    private

    def delivery_params
      params.require(:order).permit(:delivery_id)
    end
  end
end
