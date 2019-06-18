RSpec.describe Book, type: :model do
  context 'with assosiations' do
    it { is_expected.to have_many :book_authors }
    it { is_expected.to have_many :authors }
    it { is_expected.to belong_to :category }
  end

  context 'without a caption or description' do
    it { expect(build(:book, name: nil)).not_to be_valid }
    it { expect(build(:book, description: nil)).not_to be_valid }
  end

  context 'when valid' do
    it { expect(build(:book)).to be_valid }
  end
end
