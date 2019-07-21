module Orders
  class Check
    include Interactor

    def call
      if context.user
        context.order = Order.where.not(status: Order::FINISH_STATUSES).find_or_initialize_by(user_id: context.user.id)
      elsif context.order_id
        context.order = Order.find_by(id: context.order_id)
      else
        context.order = Order.create
      end
    end
  end
end
