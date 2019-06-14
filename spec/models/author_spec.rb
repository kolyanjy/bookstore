RSpec.describe Author, type: :model do
  context 'with associations' do
    subject(:author) { described_class.new }

    it { expect(author).to have_many :book_authors }
    it { expect(author).to have_many :books }
  end

  context 'when invalid without a name' do
    it { expect(build(:author, name: nil)).not_to be_valid }
  end

  context 'when valid' do
    it { expect(build(:author)).to be_valid }
  end
end
