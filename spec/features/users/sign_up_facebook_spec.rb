RSpec.describe 'log in facebook' do
  before do
    visit root_path
  end

  context 'when user trying to log in with facebook' do
    it 'click on facebook icon' do
      find('a', text: I18n.t('devise.sign_up')).click
      within('.general-main-wrap') do
        find('a.general-login-icon').click
      end

      expect(User.count).to eq(1)
      expect(page).to have_content I18n.t('devise.omniauth_callbacks.success', kind: 'Facebook')
    end
  end
end
