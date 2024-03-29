RSpec.describe Checkout::FillPayment::Create do
  subject(:result) { described_class.call(params: params, order: order) }

  let(:order) { create(:order, :payment_step) }

  describe 'call' do
    context 'with valid params' do
      let(:params) { attributes_for(:payment) }

      it do
        expect(result).to be_success
        expect(Payment.count).to eq(1)
        expect(Payment.last).to have_attributes(params)
      end
    end

    context 'with invalid params' do
      let(:params) { attributes_for(:payment, cvv: nil) }

      it do
        expect(result).to be_failure
        expect(Payment.count).to eq(0)
      end
    end
  end
end
