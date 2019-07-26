module Checkout
  class CheckPermission
    include Interactor

    def call
      context.fail! unless context.order.status_before_type_cast >= context.allowed_status
    end
  end
end
