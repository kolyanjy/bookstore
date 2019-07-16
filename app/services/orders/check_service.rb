module Orders
  class CheckService
    def initialize(order_id = nil, user = nil)
      @order_id = order_id
      @user = user
    end

    def call
      if @user
        user_order
      elsif @order_id
        order_find_by_order_id
      else
        Order.new
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
        Order.new(user_id: @user.id)
      end
    end

    def order_update_user_id
      return order_find_by_user_id if order_find_by_order_id.update(user_id: @user.id)
    end

    def order_find_by_user_id
      @order_find_by_user_id ||= Order.find_by(user_id: @user.id)
    end

    def order_find_by_order_id
      @order_find_by_order_id ||= Order.find_by(id: @order_id)
    end
  end
end
