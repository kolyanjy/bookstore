module Checkout
  class FillConfirmsController < ApplicationController
    include CheckoutCheck

    def show
      unless check_step(:fill_confirm)
        redirect_to public_send('checkout_' + current_order.status + '_path') and return
      end
    end

    def create
      result = Checkout::FillConfirm::Organizer.call(order: current_order, allowed_status: :fill_confirm)
      redirect_to public_send('checkout_' + current_order.status + '_path') and return unless result.success?
      session[:order_id] = nil

      redirect_to checkout_fill_complete_path(current_order.number)
    end
  end
end
