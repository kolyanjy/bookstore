module Checkout
  class FillDeliveriesController < ApplicationController
    include CheckoutConcern

    def show
      redirect_to(build_path) && return unless check_step(:fill_delivery)
      @deliveries = Delivery.all.order(price: :asc)
    end

    def create
      Checkout::FillDelivery::Organizer.call(
        order: current_order,
        params: delivery_params,
        allowed_status: :fill_delivery
      )
      redirect_to build_path
    end

    private

    def delivery_params
      params.require(:order).permit(:delivery_id)
    end
  end
end
