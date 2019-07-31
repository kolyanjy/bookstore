RSpec.describe Checkout::FillDelivery::Create do
  subject(:context) { described_class.call(params: params, order: order) }
  let(:order) { build(:order, :delivery_step) }
  let!(:delivery) { create(:delivery) }

  describe 'call' do
    context 'when valid params' do
      let(:params) { { delivery_id: delivery.id } }

      it do
        expect(context.success?).to eq(true)
        expect(order.delivery).to eq(delivery)
      end
    end

    context 'when invalid params' do
      let(:params) { { delivery_id: '100' } }

      it do
        expect(context).to be_failure
        expect(order.delivery).to eq(nil)
      end
    end
  end
end
