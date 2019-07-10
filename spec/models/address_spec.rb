RSpec.describe Address, type: :model do
  context 'with assosiations' do
    it { is_expected.to belong_to(:addressable) }
  end

  describe 'validation' do
    describe 'for first name' do
      it { is_expected.to validate_presence_of(:first_name) }
      it { is_expected.to validate_length_of(:first_name).is_at_least(2).is_at_most(50) }
    end

    describe 'for last name' do
      it { is_expected.to validate_presence_of(:last_name) }
      it { is_expected.to validate_length_of(:last_name).is_at_least(2).is_at_most(50) }
    end

    describe 'for city' do
      it { is_expected.to validate_presence_of(:city) }
      it { is_expected.to validate_length_of(:city).is_at_least(2).is_at_most(50) }
    end

    describe 'for zip' do
      it { is_expected.to validate_presence_of(:zip) }
      it { is_expected.to validate_length_of(:zip).is_at_least(1).is_at_most(9) }
      it { is_expected.to allow_value('123').for(:zip) }
      it { is_expected.not_to allow_value('asd').for(:zip) }
      it { is_expected.not_to allow_value('123%').for(:zip) }
    end

    describe 'for country' do
      it { is_expected.to validate_presence_of(:country) }
      it { is_expected.to validate_length_of(:country).is_at_least(2).is_at_most(50) }
    end

    describe 'for address' do
      it { is_expected.to validate_presence_of(:address) }
      it { is_expected.to validate_length_of(:address).is_at_least(2).is_at_most(100) }
    end

    describe 'for phone' do
      it { is_expected.to validate_presence_of(:phone) }
      it { is_expected.to validate_length_of(:phone).is_at_least(10).is_at_most(15) }
      it { is_expected.to allow_value('+1010101010').for(:phone) }
      it { is_expected.not_to allow_value('1010101010').for(:phone) }
      it { is_expected.not_to allow_value('asd').for(:phone) }
      it { is_expected.not_to allow_value('123%').for(:phone) }
    end
  end
end
