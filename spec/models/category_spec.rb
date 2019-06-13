RSpec.describe Category, type: :model do
  context 'with assosiations' do
    it { is_expected.to have_many :books }
  end

  context 'without a name must be invalid' do
    it { expect(build(:category, name: nil)).not_to be_valid }
  end
end
