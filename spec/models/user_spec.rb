RSpec.describe User, type: :model do
  describe 'check validation' do
    context 'without email or password must to be invalid' do
      it { expect(build(:user, email: nil)).not_to be_valid }
      it { expect(build(:user, password: nil)).not_to be_valid }
    end

    context 'when must to be valid' do
      it { expect(build(:user)).to be_valid }
    end
  end
end
