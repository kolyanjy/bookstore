module CheckoutHelper
  LAST_STEP = 5

  def clickable_steps
    Order::STEPS.first(4)
  end
end
