module Checkout
  class FillAddressesController < ApplicationController
    include CheckoutConcern

    def show
      redirect_to(cart_path) && return unless check_step(:fill_address)
      Checkout::FillAddress::BuildAddresses.call(order: current_order, user: current_user)
    end

    def create
      Checkout::FillAddress::Organizer.call(
        order: current_order,
        params: address_params,
        hidden_shipping_form: params[:hidden_shipping_form],
        allowed_status: :fill_address
      )
      redirect_to build_path
    end

    private

    def address_params
      params.require(:order).permit(
        shipping_address_attributes: Address::ADDRESS_PARAMS,
        billing_address_attributes: Address::ADDRESS_PARAMS
      )
    end
  end
end
