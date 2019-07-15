class OrderDecorator < Draper::Decorator
  delegate_all

  def order_summary
    order_items.sum(:item_price).round(2)
  end

  def sum_books
    order_items.sum(:quantity)
  end

end
