class HomeController < ApplicationController
  def index
    books = Home::HomeOrganizer.call
    @best_seller = books.best_sellers
    @slider_books = books.slider_books
  end
end
