module BooksHelper
  include Pagy::Frontend

  def stars_quantity
    stars = []
    count = 1
    Comment::COUNT_STARTS.times do
      stars << [count]
      count += 1
    end
    stars
  end
end
