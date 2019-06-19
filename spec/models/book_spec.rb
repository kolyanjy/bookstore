RSpec.describe Book, type: :model do
  context 'with assosiations' do
    it { is_expected.to have_many :book_authors }
    it { is_expected.to have_many :authors }
    it { is_expected.to belong_to :category }
  end

  context 'without a caption or description' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end
end
