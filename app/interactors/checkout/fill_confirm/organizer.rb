module Checkout
  module FillConfirm
    class Organizer
      include Interactor::Organizer

      organize Checkout::CheckPermission, Checkout::FillConfirm::Create
    end
  end
end
