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
      order_find_by_user_id || create_user_order
    end

    def create_user_order
      context.order = Order.create(user_id: context.user.id)
    end

    def order_find_by_user_id
      context.order = Order.find_by(user_id: context.user.id)
    end

    def order_find_by_order_id
      context.order = Order.find_by(id: context.order_id)
    end
  end
end
