module OrderItems
  class Create

    def call
      @order_item = @order.order_items.find_or_initialize_by(book_id: book_id)
      @order_item.update(quantity: new_calculated_quantity)
    end

    private

    def new_calculated_quantity
      @order_item.quantity + @params[:quantity].to_i
    end
  end
end
