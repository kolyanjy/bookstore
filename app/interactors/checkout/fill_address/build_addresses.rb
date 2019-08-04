module Checkout
  module FillAddress
    class BuildAddresses
      include Interactor

      def call
        build_billing_address_attributes unless context.order.billing_address

        build_shipping_address_attributes unless context.order.shipping_address
      end

      private

      def build_billing_address_attributes
        context.order.build_billing_address(context.user.billing_address
          .attributes.symbolize_keys.slice(*Address::ADDRESS_PARAMS))
      end

      def build_shipping_address_attributes
        context.order.build_shipping_address(context.user.shipping_address
          .attributes.symbolize_keys.slice(*Address::ADDRESS_PARAMS))
      end
    end
  end
end
