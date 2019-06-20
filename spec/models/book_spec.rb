RSpec.describe Book, type: :model do
  describe 'with assosiations' do
    it { is_expected.to have_many(:book_authors).dependent(:destroy) }
    it { is_expected.to have_many :authors }
    it { is_expected.to have_many :materials }
    it { is_expected.to have_many(:book_materials).dependent(:destroy) }
    it { is_expected.to belong_to :category }
  end

  context 'when valid with name and description' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end
end
