module OrderItems
  class Update
    include Interactor
    def call
      operation = context.params[:operation]
      order_item = context.order_item

      if operation == 'plus'
        order_item.increment!(:quantity)
      else
        if order_item.quantity == 1
          context.fail!
        else
          order_item.decrement!(:quantity)
        end
      end
    end
  end
end
