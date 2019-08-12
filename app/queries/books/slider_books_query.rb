module Books
  class SliderBooksQuery
    def call(quantity)
      Book.order(created_at: :desc).limit(quantity)
    end
  end
end
