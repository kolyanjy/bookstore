module Orders
  class Sort
    include Interactor

    def call
      if status_exist?
        context.orders = context.user.orders.where(status: context.status)
      else
        context.orders = context.user.orders.where(status: :in_progress) unless context.status
      end
    end

    private

    def status_exist?
      return false if context.status.nil?

      Order::FINISH_STATUSES.include?(context.status.to_sym)
    end
  end
end
