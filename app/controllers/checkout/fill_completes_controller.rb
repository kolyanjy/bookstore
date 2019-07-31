module Checkout
  class FillCompletesController < ApplicationController
    include CheckoutCheck
    def show
      @order = current_user.orders.find_by(number: params[:format]).decorate
      unless @order
        redirect_to books_path and return
      end
    end
  end
end
