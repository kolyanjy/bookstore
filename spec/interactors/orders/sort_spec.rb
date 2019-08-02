RSpec.describe Orders::Sort do
  subject(:context) { described_class.call(status: status, user: user) }

  let!(:user) { create(:user) }
  let!(:order_1) { create(:order, :in_progress_step, user: user) }
  let!(:order_2) { create(:order, :in_delivery_step, user: user) }
  let!(:order_3) { create(:order, :delivered_step, user: user) }
  let!(:order_4) { create(:order, :canceled_step, user: user) }

  context 'when status in progress' do
    let(:status) { :in_progress }

    it do
      expect(context).to be_success
      expect(context.orders.first).to eq(order_1)
    end
  end

  context 'when status in progress' do
    let(:status) { :in_delivery }

    it do
      expect(context).to be_success
      expect(context.orders.first).to eq(order_2)
    end
  end

  context 'when status in progress' do
    let(:status) { :delivered }

    it do
      expect(context).to be_success
      expect(context.orders.first).to eq(order_3)
    end
  end

  context 'when status in progress' do
    let(:status) { :canceled }

    it do
      expect(context).to be_success
      expect(context.orders.first).to eq(order_4)
    end
  end
end
