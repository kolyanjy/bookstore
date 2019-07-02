module Books
  class CategoryQuery
    def call(category_id = nil)
      category_id.nil? ? Book.all : Book.where(category_id: category_id)
    end
  end
end
