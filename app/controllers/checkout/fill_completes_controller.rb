module Checkout
  class FillCompletesController < ApplicationController
    include CheckoutConcern

    def show
      order
    end

    private

    def order
      @order ||= current_user.orders.find_by!(number: params[:number]).decorate
    end
  end
end
