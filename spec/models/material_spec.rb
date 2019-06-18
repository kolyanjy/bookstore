require 'rails_helper'

RSpec.describe Material, type: :model do
  context 'with assosiations' do
    it { is_expected.to have_many :books }
  end

  context 'when invalid without a name' do
    it { expect(build(:material, name: nil)).not_to be_valid }
  end

  context 'when same names' do
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  context 'when valid' do
    it { expect(build(:material)).to be_valid }
  end
end
