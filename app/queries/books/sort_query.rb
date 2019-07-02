module Books
  class SortQuery
    FILTERS = {
      created_at: ->(relation) { relation.order('created_at DESC') },
      popular: ->(relation) { relation.order('created_at DESC') },
      title_asc: ->(relation) { relation.order('name ASC') },
      title_desc: ->(relation) { relation.order('name DESC') },
      price_asc: ->(relation) { relation.order('price ASC') },
      price_desc: ->(relation) { relation.order('price DESC') }
    }.freeze
    DEFAULT_FILTER = :title_asc

    def call(books, filter)
      return books if filter.nil?

      result = FILTERS[filter.to_sym] || FILTERS[DEFAULT_FILTER]
      result.call(books)
    end
  end
end
