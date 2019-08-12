RSpec.describe Category, type: :model do
  describe 'assosiations' do
    it { is_expected.to have_many(:books).dependent(:destroy) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
