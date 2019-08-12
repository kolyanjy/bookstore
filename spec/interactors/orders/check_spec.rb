RSpec.describe Orders::Check do
  subject(:interactor) { described_class }

  let!(:user) { create(:user) }

  context 'when user = nil, order = nil' do
    it { expect(interactor.call.order).to be_kind_of(Order) }
  end

  context 'when order exist' do
    let(:order) { create(:order) }

    it { expect(interactor.call(order_id: order.id).order.id).to eq(order.id) }
  end

  context 'when user exist' do
    context 'when user have order' do
      let!(:order) { create(:order, user: user) }

      it { expect(interactor.call(user: user).order).to eq(order) }
    end

    context 'when user havn`t order' do
      it { expect(interactor.call(user: user).order.user_id).to eq(user.id) }
    end
  end
end
