RSpec.describe BookMaterial, type: :model do
  describe 'assosiations' do
    it { is_expected.to belong_to :material }
    it { is_expected.to belong_to :book }
  end
end
