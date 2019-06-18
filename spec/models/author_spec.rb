RSpec.describe Author, type: :model do
  context 'with associations' do
    it { is_expected.to have_many :book_authors }
    it { is_expected.to have_many :books }
  end

  context 'when invalid without a name' do
    it { expect(build(:author, first_name: nil)).not_to be_valid }
    it { expect(build(:author, last_name: nil)).not_to be_valid }
  end

  context 'when valid' do
    it { expect(build(:author)).to be_valid }
  end
end
