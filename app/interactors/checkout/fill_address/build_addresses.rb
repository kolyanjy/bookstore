module Checkout
  module FillAddress
    class BuildAddresses
      include Interactor

      def call
        unless context.order.billing_address
          context.order.build_billing_address(context.user.billing_address.
            attributes.symbolize_keys.slice(*Address::ADDRESS_PARAMS))
        end

        unless context.order.shipping_address
          context.order.build_shipping_address(context.user.shipping_address.
            attributes.symbolize_keys.slice(*Address::ADDRESS_PARAMS))
        end
      end
    end
  end
end
