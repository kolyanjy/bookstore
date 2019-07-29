module Checkout
  class FillConfirmsController < ApplicationController
    def show
      if !Checkout::CheckPermission.call(allowed_status: :fill_confirm, order: current_order).success?
        redirect_to public_send('checkout_' + current_order.status + '_path') and return
      end

    end

    def create
      Checkout::FillConfirm::Organizer.call(order: current_order, allowed_status: :fill_confirm)
      redirect_to public_send('checkout_' + current_order.status + '_path')
    end
  end
end
