module Orders
  class Sort
    include Interactor

    def call
      return context.orders = context.user.orders.where(status: :in_progress) unless context.status

      raise ActionController::BadRequest unless Order::FINISH_STATUSES.include?(context.status.to_sym)

      context.orders = context.user.orders.where(status: context.status)
    end

    private

  end
end
