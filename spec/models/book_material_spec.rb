RSpec.describe BookMaterial, type: :model do
  describe 'with assosiations' do
    it { is_expected.to belong_to :material }
    it { is_expected.to belong_to :book }
  end
end
