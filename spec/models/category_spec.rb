RSpec.describe Category, type: :model do
  describe 'with assosiations' do
    it { is_expected.to have_many(:books).dependent(:destroy) }
  end

  context 'when test validation' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
