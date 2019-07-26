module Checkout
  module FillAddresses
    class Organizer
      include Interactor::Organizer
      
      organize Checkout::CheckPermission, Checkout::FillAddresses::Create
    end
  end
end
