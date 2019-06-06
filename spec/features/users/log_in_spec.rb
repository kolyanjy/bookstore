RSpec.feature 'Log in' do
  given(:user) { create(:user) }
  given(:user_attrs) { attributes_for(:user) }

  before(:each) { visit root_path }

  scenario 'User try to login' do
    find('a', text: I18n.t('devise.login')).click
    within('.general-form') do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
    end
    click_on(I18n.t('user.login'))
    expect(page).to have_content I18n.t('devise.sessions.signed_in')
  end

  scenario 'User try to login with nonexistent mail and password' do
    find('a', text: I18n.t('devise.login')).click
    within('.general-form') do
      fill_in 'user_email', with: user_attrs[:email]
      fill_in 'user_password', with: user_attrs[:password]
    end
    click_on(I18n.t('user.login'))
    expect(page).not_to have_content I18n.t('devise.sessions.signed_in')
  end

  scenario 'User after login try to log out' do
    find('a', text: I18n.t('devise.login')).click
    within('.general-form') do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
    end
    click_on(I18n.t('user.login'))
    find('li', text: I18n.t('btn.account')).click
    find('a', text: I18n.t('btn.out')).click
    expect(page).to have_content I18n.t('devise.sessions.signed_out')
  end
end
