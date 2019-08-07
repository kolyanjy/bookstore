class OrderDecorator < Draper::Decorator
  delegate_all

  def items_sum
    order_items.sum(&:quantity)
  end

  def order_summary
    order_items.sum { |item| item.book_price * item.quantity }
  end

  def order_total
    (order_summary + delivery&.price.to_d - coupon&.price.to_d).round(2)
  end
end
