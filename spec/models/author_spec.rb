RSpec.describe Author, type: :model do
  context 'with associations' do
    it { is_expected.to have_many :book_authors }
    it { is_expected.to have_many :books }
  end

  context 'when invalid without a first or last name' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
  end
end
