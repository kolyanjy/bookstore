RSpec.describe Checkout::FillConfirm::Create do
  subject(:result) { described_class.call(order: order) }

  let(:order) { create(:order, :confirm_step, id: 123) }

  describe 'call' do
    it 'create number to order' do
      expect(order.number).to eq(nil)
      expect(result).to be_success
      expect(order.number).to eq('R00000123')
    end
  end
end
