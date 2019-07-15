class OrderItemDecorator < Draper::Decorator
  delegate_all

  def sub_total
    order_item.book.price * order_item.quantity
  end
end
