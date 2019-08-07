RSpec.describe OrdersPresenter do
  subject(:presenter) { described_class.new }

  describe 'check_status' do
    context 'when status nil' do
      let(:status) { nil }

      it { expect(presenter.check_status(status)).to eq(:in_progress) }
    end

    context 'when invalid status' do
      let(:status) { :lolkek }

      it { expect(presenter.check_status(status)).to eq(:in_progress) }
    end

    context 'when valid status' do
      let(:status) { :in_delivery }

      it { expect(presenter.check_status(status)).to eq(status) }
    end
  end
end
