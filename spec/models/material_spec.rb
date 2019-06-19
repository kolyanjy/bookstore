RSpec.describe Material, type: :model do
  context 'with assosiations' do
    it { is_expected.to have_many :book_materials }
    it { is_expected.to have_many :books }
  end

  context 'when invalid without a name' do
    it { is_expected.to validate_presence_of(:name) }
  end

  context 'when same names' do
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
