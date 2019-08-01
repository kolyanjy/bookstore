module Checkout
  class FillCompletesController < ApplicationController

    include CheckoutConcern

    def show
      current_order
    end

    private

    def current_order
      @order ||= current_user.orders.find_by!(number: params[:number]).decorate
    end
  end
end
