module Home
  class TakeSliderBooks
    include Interactor

    NUMBER_SLIDER = 3

    def call
      books = Book.order(created_at: :desc).limit(NUMBER_SLIDER)
      context.slider_books = books.decorate
    end
  end
end
