RSpec.describe BookImage, type: :model do
  it { is_expected.to have_db_column(:image).of_type(:string) }
  it { is_expected.to have_db_index(:book_id) }

  context 'when has assosiations' do
    it { is_expected.to belong_to(:book).without_validating_presence }
  end
end
