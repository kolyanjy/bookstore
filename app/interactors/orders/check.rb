module Orders
  class Check
    include Interactor

    def call
      context.order = if context.user
                        Order.where.not(status: Order::FINISH_STATUSES).find_or_initialize_by(user_id: context.user.id)
                      elsif context.order_id
                        Order.find_by(id: context.order_id)
                      else
                        Order.create
                      end
    end
  end
end
