module Checkout
  class FillPaymentsController < ApplicationController

    def show
      if !Checkout::CheckPermission.call(allowed_status: :fill_payment, order: current_order).success?
        redirect_to public_send('checkout_' + current_order.status + '_path') and return
      end
      @payment = Payment.first_or_initialize(order_id: current_order.id)
    end

    def create
      Checkout::FillPayment::Organizer.call(allowed_status: :fill_payment, order: current_order, params: payment_params)
      redirect_to public_send('checkout_' + current_order.status + '_path')
    end

    private

    def payment_params
      params.require(:payment).permit(:number, :name, :cvv, :date, order_id: current_order.id)
    end
  end
end
