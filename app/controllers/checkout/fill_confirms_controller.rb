module Checkout
  class FillConfirmsController < ApplicationController
    include CheckoutConcern

    def show
      redirect_to(checkout_step_path) && return unless check_step(:fill_confirm)
    end

    def create
      result = Checkout::FillConfirm::Organizer.call(order: current_order, allowed_status: :fill_confirm)
      redirect_to(checkout_step_path) && return unless result.success?
      session[:order_id] = nil

      redirect_to checkout_fill_complete_path(current_order.number)
    end
  end
end
