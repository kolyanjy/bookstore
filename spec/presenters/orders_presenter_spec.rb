RSpec.describe OrdersPresenter do
  subject(:presenter) { described_class.new }

  describe 'check_filter' do
    context 'when filter nil' do
      let(:filter) { nil }

      it { expect(presenter.check_sort(filter)).to eq(Order::FINISH_STATUSES.first) }
    end

    context 'when invalid filter' do
      let(:filter) { :lolkek }

      it { expect(presenter.check_sort(filter)).to eq(Order::FINISH_STATUSES.first) }
    end

    context 'when valid filter' do
      let(:filter) { :in_delivery }

      it { expect(presenter.check_sort(filter)).to eq(filter) }
    end
  end
end
