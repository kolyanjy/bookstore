module Checkout
  module FillConfirm
    class Create
      include Interactor

      NUMBER_PREFIX = 'R'.freeze
      NUMBER_QUANTITY = 8

      def call
        ActiveRecord::Base.transaction do
          return context.fail! unless update_order

          return context.fail! unless update_order_items

          context.order.confirm! if context.order.fill_confirm?
        end
      end

      private

      def update_order
        context.order.update(number: build_number, delivery_price: context.order.delivery.price)
      end

      def update_order_items
        context.order.order_items.each do |item|
          return false unless item.update(price: item.book_price)
        end
      end

      def build_number
        id = context.order.id.to_s
        NUMBER_PREFIX + id.rjust(NUMBER_QUANTITY, '0')
      end
    end
  end
end
