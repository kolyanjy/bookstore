RSpec.describe Checkout::FillPayment::Create do
  subject(:context) { described_class.call(params: params, order: order) }

  let(:order) { create(:order, :payment_step) }

  describe 'call' do
    context 'with valid params' do
      let(:params) { attributes_for(:payment) }

      it do
        expect(context.success?).to eq(true)
        expect(Payment.count).to eq(1)
      end
    end

    context 'with invalid params' do
      let(:params) { attributes_for(:payment, cvv: nil) }

      it do
        expect(context.success?).to eq(false)
        expect(Payment.count).to eq(0)
      end
    end
  end
end
