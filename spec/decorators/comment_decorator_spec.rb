RSpec.describe CommentDecorator do
  let!(:comment) { build(:comment).decorate }

  describe 'grey stars count' do
    it { expect(comment.gray_stars_count).to eq(Comment::COUNT_STARTS - comment.mark) }
  end

  describe 'first user email letter' do
    it { expect(comment.first_char_user_email).to eq(comment.user_email.first) }
  end
end
