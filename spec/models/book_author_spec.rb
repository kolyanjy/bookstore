RSpec.describe BookAuthor, type: :model do
  describe 'assosiations' do
    it { is_expected.to belong_to :author }
    it { is_expected.to belong_to :book }
  end
end
