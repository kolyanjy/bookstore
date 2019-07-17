class OrderItemsController < ApplicationController
  before_action :setup_order_item

  def create
    OrderItems::Create.call(params: permitted_params, current_order: current_order)
    session[:order_id] = current_order.id
    # binding.pry
    redirect_back(fallback_location: :fallback_location, notice: t('order_item.success_update'))
  end

  def destroy
    @order_item.destroy
    redirect_to carts_path, flash: { success: t('order_item.success_delete') }
  end

  def update
    result = OrderItems::Update.call(params: params, order_item: @order_item)
    if result.success?
      redirect_to carts_path, flash: { success: t('order_item.success_update') }
    else
      redirect_to carts_path, flash: { danger: t('order_item.error_update') }
    end
  end

  private

  def setup_order_item
    @order_item ||= OrderItem.find_by(id: params[:id])
  end

  def permitted_params
    params.require(:order_items).permit(:quantity, :book_id)
  end
end
