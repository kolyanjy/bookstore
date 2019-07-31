RSpec.describe Checkout::FillConfirm::Create do
  subject(:context) { described_class.call(order: order) }
  let(:order) { create(:order, :confirm_step) }

  describe 'call' do
    it 'create number to order' do
      expect(order.number).to eq(nil)
      expect(context.success?).to eq(true)
      expect(order.number.length).to eq(Checkout::FillConfirm::Create::NUMBER_QUANTITY)
    end
  end

end
