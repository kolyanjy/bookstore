module Home
  class HomeOrganizer
    include Interactor::Organizer

    organize Home::TakeBestSellers, Home::TakeSliderBooks
  end
end
