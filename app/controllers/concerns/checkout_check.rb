module CheckoutCheck
  def check_step(step, order)
    Checkout::CheckPermission.call(allowed_status: step, order: current_order).success?
  end
end
