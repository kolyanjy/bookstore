RSpec.describe Category, type: :model do
  context 'with assosiations' do
    it { is_expected.to have_many :books }
  end

  context 'without a name must be invalid' do
    it { is_expected.to validate_presence_of(:name) }
  end

  context 'when same names' do
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
