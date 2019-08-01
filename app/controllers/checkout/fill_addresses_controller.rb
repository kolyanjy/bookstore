module Checkout
  class FillAddressesController < ApplicationController
    include CheckoutConcern

    def show
      unless check_step(:fill_address)
        redirect_to cart_path and return
      end
      Checkout::FillAddress::BuildAddresses.call(order: current_order, user: current_user)
    end

    def create
      Checkout::FillAddress::Organizer.call(
        order: current_order, params: address_params, hidden_shipping_form: params[:hidden_shipping_form],
        allowed_status: :fill_address)
      redirect_to public_send('checkout_' + current_order.status + '_path')
    end

    private

    def address_params
      params.require(:order).permit(
        shipping_address_attributes: Address::ADDRESS_PARAMS,
        billing_address_attributes: Address::ADDRESS_PARAMS,
      )
    end
  end
end
