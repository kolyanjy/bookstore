module Checkout
  module FillAddress
    class BuildAddresses
      include Interactor

      def call
        build_address('billing_address') unless context.order.billing_address

        build_address('shipping_address') unless context.order.shipping_address
      end

      private

      def build_address(address)
        context.order.public_send(
          "build_#{address}",
          context.user.public_send(address).slice(*Address::ADDRESS_PARAMS)
        )
      end
    end
  end
end
