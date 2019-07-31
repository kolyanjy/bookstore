module CheckoutCheck
  def check_step(step)
    Checkout::CheckPermission.call(allowed_status: step, order: current_order).success?
  end
end
