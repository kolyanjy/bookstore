class BookDecorator < Draper::Decorator
  decorates_association :authors

  delegate_all
end
