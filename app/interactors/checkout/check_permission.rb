module Checkout
  class CheckPermission
    include Interactor

    def call
      return context.fail! unless context.order.status_before_type_cast >= Order.statuses[context.allowed_status]
    end
  end
end
