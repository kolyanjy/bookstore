RSpec.describe OrderItems::Update do
  subject(:context) { described_class.call(params: params, order_item: order_item) }
  let!(:order_item) { create(:order_item, book: book) }
  let!(:book) { create(:book) }

  describe 'call' do
    context 'when valid' do
      let(:params) { { quantity: 2  } }

      it do
        expect(context.success?).to eq(true)
        expect(order_item.quantity).to eq(2)
      end
    end

    context 'when invalid' do
      let(:params) { { quantity: nil } }

      it do
        expect(context.success?).to eq(false)
        expect(order_item.quantity).to eq(nil)
      end
    end
  end
end
