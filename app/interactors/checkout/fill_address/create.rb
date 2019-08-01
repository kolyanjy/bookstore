module Checkout
  module FillAddress
    class Create
      include Interactor

      def call
        ActiveRecord::Base.transaction do
          return context.fail! unless context.order.update(build_attributes)

          context.order.filling_delivering! if context.order.fill_address?
        end
      end

      private

      def build_attributes
        hash = {}
        if context.hidden_shipping_form[:show] == '1'
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
