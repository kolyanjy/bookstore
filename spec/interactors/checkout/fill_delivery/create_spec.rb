RSpec.describe Checkout::FillDelivery::Create do
  subject(:result) { described_class.call(params: params, order: order) }

  let(:order) { build(:order, :delivery_step) }
  let!(:delivery) { create(:delivery) }

  describe 'call' do
    context 'when valid params' do
      let(:params) { { delivery_id: delivery.id } }

      it do
        expect(result).to be_success
        expect(order.delivery).to eq(delivery)
      end
    end

    context 'when invalid params' do
      let(:params) { { delivery_id: '100' } }

      it do
        expect(result).to be_failure
        expect(order.delivery).to eq(nil)
      end
    end
  end
end
