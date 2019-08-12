module Comments
  class Create
    include Interactor

    def call
      book = Book.find(context.book_id)
      comment = Comment.new(context.params) do |model|
        model.book = book
        model.user = context.user
        model.verified = user_buy_book?
      end

      context.comment = comment
      context.fail! unless comment.save
    end

    private

    def user_buy_book?
      context.user.orders.delivered.joins(:order_items).merge(OrderItem.where(book: context.book_id)).exists?
    end
  end
end
