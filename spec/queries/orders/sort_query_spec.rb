RSpec.describe Orders::SortQuery do
  subject(:result) { described_class.new(user, status).call }

  let!(:user) { create(:user) }
  let!(:order_1) { create(:order, :in_progress_step, user: user) }
  let!(:order_2) { create(:order, :in_delivery_step, user: user) }
  let!(:order_3) { create(:order, :delivered_step, user: user) }
  let!(:order_4) { create(:order, :canceled_step, user: user) }

  context 'when status in progress' do
    let(:status) { :in_progress }

    it do
      expect(result).to eq([order_1])
    end
  end

  context 'when status in delivery' do
    let(:status) { :in_delivery }

    it do
      expect(result).to eq([order_2])
    end
  end

  context 'when status delivered' do
    let(:status) { :delivered }

    it do
      expect(result).to eq([order_3])
    end
  end

  context 'when status canceled' do
    let(:status) { :canceled }

    it do
      expect(result).to eq([order_4])
    end
  end

  context 'when status lolkek' do
    let(:status) { :lolkek }

    it do
      expect(result).to eq([order_1])
    end
  end
end
