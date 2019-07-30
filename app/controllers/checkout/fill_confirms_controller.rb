module Checkout
  class FillConfirmsController < ApplicationController
    include CheckoutCheck

    def show
      unless check_step(:fill_confirm, current_order)
        redirect_to public_send('checkout_' + current_order.status + '_path') and return
      end
    end

    def create
      Checkout::FillConfirm::Organizer.call(order: current_order, allowed_status: :fill_confirm)
      redirect_to public_send('checkout_' + current_order.status + '_path')
    end
  end
end
