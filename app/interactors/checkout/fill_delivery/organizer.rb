module Checkout
  module FillDelivery
    class Organizer
      include Interactor::Organizer

      organize Checkout::CheckPermission, Checkout::FillDelivery::Create
    end
  end
end
