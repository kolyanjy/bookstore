RSpec.describe BookAuthor, type: :model do
  context 'with assosiations' do
    it { is_expected.to belong_to :author }
    it { is_expected.to belong_to :book }
  end
end
