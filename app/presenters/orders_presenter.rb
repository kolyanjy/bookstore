class OrdersPresenter
  def check_sort(filter)
    filter_exist?(filter) ? filter : Order::FINISH_STATUSES.first
  end

  private

  def filter_exist?(filter)
    return false if filter.nil?

    Order::FINISH_STATUSES.include?(filter.to_sym)
  end
end
