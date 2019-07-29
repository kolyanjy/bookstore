module Checkout
  module FillAddress
    class Create
      include Interactor

      def call
        return context.fail! unless ActiveRecord::Base.transaction do
          context.order.update(build_attributes)
          context.order.fill_delivery!
        end
      end

      private

      def build_attributes
        hash = Hash.new
        if context.hidden_shipping_form[:show] == "1"
           hash[:billing_address_attributes] = context.params[:billing_address_attributes]
           hash[:shipping_address_attributes] = context.params[:billing_address_attributes]
        else
          hash = context.params
        end
        hash
      end
    end
  end
end
