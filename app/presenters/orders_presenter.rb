class OrdersPresenter
  def status_name(status)
    status.to_s.split('_').join(' ').capitalize
  end

  def check_status(status)
    status_exist?(status) ? status : Order::FINISH_STATUSES.first
  end

  private

  def status_exist?(status)
    return false if status.nil?

    Order::FINISH_STATUSES.include?(status.to_sym)
  end
end
