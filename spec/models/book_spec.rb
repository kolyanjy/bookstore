RSpec.describe Book, type: :model do
  describe 'assosiations' do
    it { is_expected.to have_many(:book_authors).dependent(:destroy) }
    it { is_expected.to have_many :authors }
    it { is_expected.to have_many :materials }
    it { is_expected.to have_many(:book_materials).dependent(:destroy) }
    it { is_expected.to have_many(:order_items).dependent(:nullify) }
    it { is_expected.to belong_to :category }
    it { puts 'lolkek' }
  end

  describe 'validation' do
    it { puts 'lolkek' }

    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_presence_of(:description) }
  end
end
