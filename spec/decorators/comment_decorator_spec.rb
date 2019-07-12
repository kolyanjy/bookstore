RSpec.describe CommentDecorator do
  let!(:comment) { build(:comment).decorate }

  describe 'grey stars count' do
    let(:num) { 3 }

    it { expect(comment.gray_stars_count(num)).to eq(2) }
  end

  describe 'first user email letter' do
    it { expect(comment.first_char_user_email).to eq(comment.user_email.first) }
  end
end
