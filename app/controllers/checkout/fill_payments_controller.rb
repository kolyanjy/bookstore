module Checkout
  class FillPaymentsController < ApplicationController
    include CheckoutConcern

    def show
      redirect_to(build_path) && return unless check_step(:fill_payment)
      @payment = Payment.first_or_initialize(order_id: current_order.id)
    end

    def create
      Checkout::FillPayment::Organizer.call(allowed_status: :fill_payment, order: current_order, params: payment_params)
      redirect_to build_path
    end

    private

    def payment_params
      params.require(:payment).permit(:number, :name, :cvv, :date)
    end
  end
end
