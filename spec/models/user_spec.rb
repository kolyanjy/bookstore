RSpec.describe User, type: :model do
  describe 'assosiations' do
    it { is_expected.to have_many(:addresses).dependent(:destroy) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }

    it { is_expected.to have_one(:billing_address).dependent(:destroy) }
    it { is_expected.to accept_nested_attributes_for(:billing_address).update_only(true) }

    it { is_expected.to have_one(:shipping_address).dependent(:destroy) }
    it { is_expected.to accept_nested_attributes_for(:shipping_address).update_only(true) }
  end
end
