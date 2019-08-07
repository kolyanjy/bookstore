module Books
  class SliderBooksQuery
    NUMBER_SLIDER = 3

    def call
      Book.order(created_at: :desc).limit(NUMBER_SLIDER).decorate
    end
  end
end
