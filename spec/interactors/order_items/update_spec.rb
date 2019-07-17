RSpec.describe OrderItems::Update do
  subject(:context) { described_class.call(params: params, order_item: order_item) }
  let!(:order_item) { create(:order_item, book: book) }
  let!(:book) { create(:book) }

  describe 'call' do
    context 'when plus' do
      let(:params) { { operation: 'plus' } }

      it do
        expect(context.success?).to eq(true)
        expect(order_item.quantity).to eq(2)
      end
    end

    context 'when plus' do
      let(:params) { { operation: 'minus' } }
      let(:order_item) { create(:order_item, book: book, quantity: 2) }

      it do
        expect(context.success?).to eq(true)
        expect(order_item.quantity).to eq(1)
      end
    end

    context 'when invalid minus' do
      let(:params) { { operation: 'minus' } }

      it do
        expect(context.success?).to eq(false)
        expect(order_item.quantity).to eq(1)
      end
    end
  end
end
