RSpec.describe AuthorDecorator do
  let(:author) { build(:author).decorate }

  describe 'full name' do
    it { expect(author.full_name).to eq(author.first_name + ' ' + author.last_name) }
  end
end
