module Checkout
  module FillConfirm
    class Create
      include Interactor

      NUMBER_QUANTITY = 9

      def call
        return context.fail! unless context.order.update(number: build_number)

        context.order.confirm! if context.order.fill_confirm?
      end

      private

      def build_number
        id_length = context.order.id.to_s.length
        'R'.rjust(NUMBER_QUANTITY - id_length, '0').reverse + context.order.id.to_s
      end
    end
  end
end
