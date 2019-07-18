class OrderDecorator < Draper::Decorator
  delegate_all

  def items_sum
    order_items.sum(:quantity)
  end
end
