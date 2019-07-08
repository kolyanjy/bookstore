class HomeController < ApplicationController
  NUMBER_SLIDER = 3
  NUMBER_BEST_SELLER = 4

  decorates_assigned :slider_books

  def index
    @best_seller = BookDecorator.decorate_collection(Book.first(NUMBER_BEST_SELLER))
    @slider_books = BookDecorator.decorate_collection(Book.last(NUMBER_SLIDER))
  end
end
