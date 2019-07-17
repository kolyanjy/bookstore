RSpec.describe OrderItemsController, type: :controller do
  let!(:order) { create(:order) }
  let(:book) { create(:book) }

  describe '#create' do
    let(:order_item) { build(:order_item, book: book) }

    it 'success add line_item' do
      expect(OrderItem.count).to eq(0)
      post :create, params: { book_id: order_item.book_id, order_items: { book_id: order_item.book_id, quantity: 1 } }
      expect(response.status).to eq 302
      expect(OrderItem.count).to eq(1)
   end

  end
end
