class BooksQuery
  FILTERS = {
    created_at_desc: I18n.t('categories.created_at_desc'),
    popular: I18n.t('categories.popular'),
    title_asc: I18n.t('categories.title_asc'),
    title_desc: I18n.t('categories.title_desc'),
    price_asc: I18n.t('categories.price_asc'),
    price_desc: I18n.t('categories.price_desc')
    }.freeze

  def initialize(category_id = nil)
    @books = category_id.nil? ? Book.all : Book.by_category(category_id)
  end

  def books_sort(filter)
    case filter
    when FILTERS[:price_asc] then @books.order('price ASC')
    when FILTERS[:price_desc] then @books.order('price DESC')
    when FILTERS[:title_asc] then @books.order('name ASC')
    when FILTERS[:title_desc] then @books.order('name DESC')
    when FILTERS[:popular] then @books.order('created_at DESC')
    else
      @books.order('created_at DESC')
    end
  end
end
