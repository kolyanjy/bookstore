require 'rails_helper'

RSpec.describe BookImage, type: :model do
  it { is_expected.to have_db_column(:image).of_type(:string) }
  it { is_expected.to have_db_index(:book_id) }

  context 'has assosiations' do
    it { is_expected.to belong_to(:book).without_validating_presence }
  end
end
