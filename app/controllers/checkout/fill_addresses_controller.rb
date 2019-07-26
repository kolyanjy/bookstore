module Checkout
  class FillAddressesController < ApplicationController

    def show
      current_order.build_billing_address(current_user.billing_address.
        attributes.symbolize_keys.slice(*Users::AddressesController::ADDRESS_PARAMS))

      current_order.build_shipping_address(current_user.shipping_address.
        attributes.symbolize_keys.slice(*Users::AddressesController::ADDRESS_PARAMS))
    end

    def create
      Checkout::FillAddresses::Organizer.call(
        order: current_order, params: address_params, hidden_shipping_form: params[:hidden_shipping_form], allowed_status: 1)
      redirect_to public_send('checkout_' + current_order.status + '_path')
    end

    private


    def address_params
      params.require(:order).permit(
        shipping_address: Users::AddressesController::ADDRESS_PARAMS,
        billing_address: Users::AddressesController::ADDRESS_PARAMS,
        hidden_shipping_form: :show
      )
    end
  end
end
