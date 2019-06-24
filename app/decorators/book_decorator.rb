class BookDecorator < Draper::Decorator
  LENGTH_DESCRIPTION = 70

  decorates_association :authors

  delegate_all
  def authors_title
    authors.map(&:full_name).join(', ')
  end

  def short_description
    book.description.truncate(LENGTH_DESCRIPTION)
  end

  def long_description?
    book.description.length > LENGTH_DESCRIPTION
  end

  def full_description
    book.description
  end

  def dimensions
    "H:#{book.height} x W:#{book.width} x D:#{book.depth}"
  end

  def first_book_image(version)
    book_images.first_or_initialize.image.url(version)
  end
end
