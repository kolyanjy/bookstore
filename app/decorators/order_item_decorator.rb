class OrderItemDecorator < Draper::Decorator
  delegate_all

  decorates_association :book
end
