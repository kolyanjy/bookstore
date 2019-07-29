module Checkout
  module FillConfirm
    class Create
      include Interactor

      RANGE_NUMBER = 1..14.freeze

      def call
        return context.fail! unless context.order.update(number: generate_number)
        context.order.fill_complete!
      end

      private

      def generate_number
        order = Order.order(number: :asc).last
        number = nil
        if order.number.nil?
          number = 'R1'
        else
          order_number = order.number.slice(RANGE_NUMBER).to_i
          order_number += 1
          number = 'R' + order_number.to_s
        end
        number
      end
    end
  end
end
