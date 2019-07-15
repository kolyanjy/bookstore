class OrderItemsController < ApplicationController
  def create
    binding.pry
    OrderItems::Create.new(permitted_params, current_order, params['book_id']).call
    session[:order_id] = current_order.id
  end

  def destroy
    @order_item.destroy
    redirect_to cart_path(current_order), flash: { success: t('order_item.success_delete') }
  end

  private

  def permitted_params
    params.require(:order_items).permit(:quantity)
  end
end
