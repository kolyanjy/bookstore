module Checkout
  class FillAddressesController < ApplicationController

    def show
      unless current_order.billing_address
        current_order.build_billing_address(current_user.billing_address.
          attributes.symbolize_keys.slice(*Users::AddressesController::ADDRESS_PARAMS))
      end

      unless current_order.shipping_address
        current_order.build_shipping_address(current_user.shipping_address.
          attributes.symbolize_keys.slice(*Users::AddressesController::ADDRESS_PARAMS))
      end
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
        shipping_address_attributes: Users::AddressesController::ADDRESS_PARAMS,
        billing_address_attributes: Users::AddressesController::ADDRESS_PARAMS,
      )
    end
  end
end
