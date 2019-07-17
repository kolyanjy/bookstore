module Orders
  class Check
    include Interactor

    def call
      if context.user
        user_order
      elsif context.order_id
        order_find_by_order_id
      else
        context.order = Order.create
      end
    end

    private

    def user_order
      return create_user_order unless order_find_by_user_id

      order_find_by_user_id
    end

    def create_user_order
      if order_find_by_order_id
        order_update_user_id
      else
        context.order = Order.new(user_id: context.user.id)
      end
    end

    def order_update_user_id
      return order_find_by_user_id if order_find_by_order_id.update(user_id: context.user.id)
    end

    def order_find_by_user_id
      context.order ||= Order.find_by(user_id: context.user.id)
    end

    def order_find_by_order_id
      context.order ||= Order.find_by(id: context.order_id)
    end
  end
end
