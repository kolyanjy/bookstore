class OrderItemDecorator < Draper::Decorator
  delegate_all

  decorates_association :book

  def price
    order_item.book_price * order_item.quantity
  end
end
