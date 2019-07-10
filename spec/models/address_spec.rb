RSpec.describe Address, type: :model do
  context 'with assosiations' do
    it { is_expected.to belong_to(:addressable) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:first_name) }
    it {is_expected.to validate_length_of(:first_name).is_at_least(2).is_at_most(50) }

    it { is_expected.to validate_presence_of(:last_name) }
    it {is_expected.to validate_length_of(:last_name).is_at_least(2).is_at_most(50) }

    it { is_expected.to validate_presence_of(:city) }
    it {is_expected.to validate_length_of(:city).is_at_least(2).is_at_most(50) }

    it { is_expected.to validate_presence_of(:zip) }
    it {is_expected.to validate_length_of(:zip).is_at_least(1).is_at_most(9) }

    it { is_expected.to validate_presence_of(:country) }
    it {is_expected.to validate_length_of(:country).is_at_least(2).is_at_most(50) }

    it { is_expected.to validate_presence_of(:address) }
    it {is_expected.to validate_length_of(:address).is_at_least(2).is_at_most(100) }

    it { is_expected.to validate_presence_of(:phone) }
    it {is_expected.to validate_length_of(:phone).is_at_least(10).is_at_most(12) }
  end
end
