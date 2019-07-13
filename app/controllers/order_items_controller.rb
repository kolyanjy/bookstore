class OrderItemsController < ApplicationController
  def create
    OrderItems::Create.new(permitted_params, current_order, book_id).call
    session[:order_id] = current_order.id
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @order_item.destroy
    redirect_to cart_path(current_order), flash: { success: t('order_item.success_delete') }
  end
end
