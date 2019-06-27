module Books # rubocop:disable Style/ClassAndModuleChildren
  class CategoryQuery
    def call(category_id = nil)
      category_id.nil? ? Book.all : Book.by_category(category_id)
    end
  end
end
