module OrderItems
  class Create
    include Interactor

    def call
      @order_item = context.current_order.order_items.find_or_initialize_by(book_id: context.params[:book_id])
      @order_item.update(quantity: new_calculated_quantity)
    end

    private

    def new_calculated_quantity
      @order_item.quantity + context.params[:quantity].to_i
    end
  end
end
