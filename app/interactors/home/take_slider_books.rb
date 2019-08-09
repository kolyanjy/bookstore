module Home
  class TakeSliderBooks
    include Interactor

    NUMBER_SLIDER = 3

    def call
      books = Books::SliderBooksQuery.new.call(NUMBER_SLIDER)
      context.slider_books = books.decorate
    end
  end
end
