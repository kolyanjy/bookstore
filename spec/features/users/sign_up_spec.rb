RSpec.feature 'Sign up', type: :feature do
  given(:user_attrs) { attributes_for(:user) }
  given(:invalid_email) { "0@gmail.com" }
  given(:invalid_password) { "123" }
  before(:each) { visit root_path }

  scenario 'User try to sign uo with valid data' do
    find('a', text: I18n.t('devise.sign_up')).click
    expect(page).to have_content I18n.t('devise.sign_up')
    within('.general-form') do
      fill_in 'user_email', with: user_attrs[:email]
      fill_in 'user_password', with: user_attrs[:password]
      fill_in 'user_password_confirmation', with: user_attrs[:password]
    end
    click_on(I18n.t('user.registration.sign_up'))
    expect(User.count).to eq(1)
  end

  scenario 'User try to sign up with invalid data' do
    find('a', text: I18n.t('devise.sign_up')).click
    expect(page).to have_content I18n.t('devise.sign_up')
    within('.general-form') do
      fill_in 'user_email', with: invalid_email
      fill_in 'user_password', with: invalid_password
      fill_in 'user_password_confirmation', with: invalid_password
    end
    within('.general-form') do
      click_on(I18n.t('user.registration.sign_up'))
    end
    expect(page).not_to have_content I18n.t('devise.registration.signed_up')
    expect(User.count).to eq(0)
  end

end
