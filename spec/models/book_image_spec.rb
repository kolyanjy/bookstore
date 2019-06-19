RSpec.describe BookImage, type: :model do
  context 'with assosiations' do
    it { is_expected.to belong_to(:book).without_validating_presence }
  end
end
