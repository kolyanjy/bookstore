RSpec.describe Category, type: :model do
  context 'with assosiations' do
    it { is_expected.to have_many :books }
  end

  context 'without a name must be invalid' do
    it { expect(build(:category, name: nil)).not_to be_valid }
  end

  context 'when same names' do
    let(:category) { build(:category) }
    let(:klass) { described_class }

    before { klass.create(name: category) }

    it { expect(klass.create(name: category).valid?).to eq(false) }
  end

  context 'when valid' do
    it { expect(build(:category)).to be_valid }
  end
end
