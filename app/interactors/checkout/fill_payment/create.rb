module Checkout
  module FillPayment
    class Create
      include Interactor

      def call
        payment = Payment.new(context.params) do |model|
          model.order = context.order
        end

        return context.fail! unless ActiveRecord::Base.transaction do
          payment.save
          context.order.fill_confirm!
        end
      end
    end
  end
end
