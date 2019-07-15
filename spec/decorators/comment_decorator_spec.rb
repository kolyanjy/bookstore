RSpec.describe CommentDecorator do
  let(:user) { build(:user) }
  let!(:comment) { build(:comment, user: user, mark: 3).decorate }

  describe 'grey stars count' do
    let(:count_stars) { stub_const('Comment::COUNT_STARTS', 5) }

    it { expect(comment.gray_stars_count).to eq(2) }
  end

  describe 'first user email letter' do
    let(:first_letter) { user.email.first }

    it { expect(comment.first_char_user_email).to eq(first_letter) }
  end
end
