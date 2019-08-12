module Checkout
  module FillAddress
    class Organizer
      include Interactor::Organizer

      organize Checkout::CheckPermission, Checkout::FillAddress::Create
    end
  end
end
