module Checkout
  class CheckPermission
    include Interactor

    def call
      return context.fail! unless Order.statuses[context.order.status] >= Order.statuses[context.allowed_status]
    end
  end
end
