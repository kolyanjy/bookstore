module CheckoutConcern
  def check_step(order_step)
    Checkout::CheckPermission.call(allowed_status: order_step, order: current_order).success?
  end
end
