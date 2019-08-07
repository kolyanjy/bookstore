module Checkout
  module FillPayment
    class Organizer
      include Interactor::Organizer

      organize Checkout::CheckPermission, Checkout::FillPayment::Create
    end
  end
end
