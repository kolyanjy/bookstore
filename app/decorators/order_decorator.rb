class OrderDecorator < Draper::Decorator
  delegate_all

  def items_sum
    order_items.sum(&:quantity)
  end

  def order_summary
    summary = 0
    order_items.each do |item|
      summary += item.book.price * item.quantity
    end
    summary
  end

  def order_total
    if coupon
      (order_summary + (delivery&.price).to_i - coupon.price).round(2)
    else
      (order_summary + (delivery&.price).to_i).round(2)
    end
  end
end
