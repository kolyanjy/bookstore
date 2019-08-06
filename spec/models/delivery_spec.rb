RSpec.describe Delivery, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:orders).dependent(:nullify) }
  end
end
