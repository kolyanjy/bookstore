module Checkout
  module FillDelivery
    class Create
      include Interactor

      def call
        return context.fail! unless Delivery.find_by(id: context.params[:delivery_id])

        update_delivery
      end

      private

      def update_delivery
        ActiveRecord::Base.transaction do
          return context.fail! unless context.order.update(context.params)

          context.order.filling_payments! if context.order.fill_delivery?
        end
      end
    end
  end
end
