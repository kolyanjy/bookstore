class BookDecorator < Draper::Decorator
  decorates_association :authors

  delegate_all

  def first_book_image(version)
    book_images.first_or_initialize.image.url(version)
  end
end
