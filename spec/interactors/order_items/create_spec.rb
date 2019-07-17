RSpec.describe OrderItems::Create do
  subject(:context) { described_class.call(params: order_item, current_order: order) }

  let!(:order) { create(:order) }
  let!(:book) { create(:book) }

  describe 'call' do
    context 'with valid params' do
      let(:order_item) { { quantity: '1', book_id: book.id } }

      it do
        expect(context.success?).to eq(true)
        expect(OrderItem.count).to eq(1)
      end
    end

    context 'with valid params' do
      let(:order_item) { { quantity: '1', book_id: nil } }

      it do
        expect(context.success?).to eq(false)
        expect(OrderItem.count).to eq(0)
      end
    end
  end
end
