class AddressesPresenter
  def initialize(entity)
    @entity = entity
  end

  def shipping_address
    @entity.shipping_address
  end

  def billing_address
    @entity.billing_address
  end
end
