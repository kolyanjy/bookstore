module Checkout
  module FillPayment
    class Create
      include Interactor

      def call
        payment = Payment.new(context.params) do |model|
          model.order = context.order
        end
        ActiveRecord::Base.transaction do
          return context.fail! unless payment.save

          context.order.filling_confirm! if context.order.fill_payment?
        end
      end
    end
  end
end
