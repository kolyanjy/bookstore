RSpec.describe Comment, type: :model do
  describe 'assosiations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :book }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_least(2).is_at_most(50) }

    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_least(10).is_at_most(500) }

    it { is_expected.to validate_presence_of(:mark) }
    it { is_expected.to validate_numericality_of(:mark).is_greater_than_or_equal_to(1).is_less_than_or_equal_to(5) }
  end
end
