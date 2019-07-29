module Checkout
  module FillDelivery
    class Create
      include Interactor

      def call
        return context.fail! unless context.order.update(context.params)
        context.order.fill_payment!
      end
    end
  end
end
