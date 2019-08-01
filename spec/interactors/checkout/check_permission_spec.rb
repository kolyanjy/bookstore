RSpec.describe Checkout::CheckPermission do
  subject(:interactor) { described_class }

  context 'when cart step' do
    let(:order) { create(:order) }

    variants = {
      fill_address: false, fill_delivery: false, fill_payment: false, fill_confirm: false, in_progress: false
    }
    variants.each do |key, value|
      it { expect(interactor.call(order: order, allowed_status: key).success?).to eq(value) }
    end
  end

  context 'when address step' do
    let(:order) { create(:order, :address_step) }

    variants = {
      fill_address: true, fill_delivery: false, fill_payment: false, fill_confirm: false, in_progress: false
    }
    variants.each do |key, value|
      it { expect(interactor.call(order: order, allowed_status: key).success?).to eq(value) }
    end
  end

  context 'when delivery step' do
    let(:order) { create(:order, :delivery_step) }

    variants = { fill_address: true, fill_delivery: true, fill_payment: false, fill_confirm: false, in_progress: false }

    variants.each do |key, value|
      it { expect(interactor.call(order: order, allowed_status: key).success?).to eq(value) }
    end
  end

  context 'when payment step' do
    let(:order) { create(:order, :payment_step) }

    variants = { fill_address: true, fill_delivery: true, fill_payment: true, fill_confirm: false, in_progress: false }
    variants.each do |key, value|
      it { expect(interactor.call(order: order, allowed_status: key).success?).to eq(value) }
    end
  end

  context 'when confirm step' do
    let(:order) { create(:order, :confirm_step) }

    variants = { fill_address: true, fill_delivery: true, fill_payment: true, fill_confirm: true, in_progress: false }
    variants.each do |key, value|
      it { expect(interactor.call(order: order, allowed_status: key).success?).to eq(value) }
    end
  end

  context 'when complete step' do
    let(:order) { create(:order, :in_progress_step) }

    variants = { fill_address: true, fill_delivery: true, fill_payment: true, fill_confirm: true, in_progress: true }
    variants.each do |key, value|
      it { expect(interactor.call(order: order, allowed_status: key).success?).to eq(value) }
    end
  end
end
