module Checkout
  module FillAddresses
    class Create
      include Interactor

      def call
        return context.fail! unless ActiveRecord::Base.transaction do
          BillingAddress.new(addressable: context.order, attributes: context.params[:billing_address]).save
          ShippingAddress.new(addressable: context.order, attributes: shipping_address).save
          context.order.fill_delivery!
        end
      end

      private

      def shipping_address
        if context.hidden_shipping_form[:show] == "1"
          context.params[:billing_address]
        else
          context.params[:shipping_address]
        end
      end
    end
  end
end
