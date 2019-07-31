RSpec.describe Payment, type: :model do
  describe 'assosiations' do
    it { is_expected.to belong_to(:order) }
  end

  describe 'validation' do
    describe 'number' do
      it { is_expected.to validate_presence_of(:number) }
      it { is_expected.to validate_length_of(:number).is_equal_to(16) }
      it { is_expected.to allow_value('1234123412341234').for(:number) }
      it { is_expected.not_to allow_value('asdasdasdasdasda').for(:number) }
    end

    describe 'cvv' do
      it { is_expected.to validate_presence_of(:cvv) }
      it { is_expected.to allow_value('123').for(:cvv) }
      it { is_expected.not_to allow_value('asd').for(:cvv) }
    end

    describe 'name' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_length_of(:name).is_at_least(1).is_at_most(50) }
    end

    describe 'date' do
      it { is_expected.to validate_presence_of(:date) }
      it { is_expected.to validate_length_of(:date).is_at_least(4).is_at_most(5) }
    end

  end
end
