module OrderItems
  class Update
    include Interactor
    def call
      context.fail! unless context.order_item.update(quantity: context.params[:quantity])
    end
  end
end
