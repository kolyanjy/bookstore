RSpec.describe 'Settings', type: :feature do
  let!(:user) { create(:user) }
  let(:new_email) { 'new_email@gmail.com' }
  let(:valid_str) { 'testTest' }
  let(:valid_zip) { 123 }
  let(:valid_phone) { '+380636472129' }
  let(:empty) {}

  before do
    login_as(user, scope: :user)
  end

  describe 'user click settings' do
    it do
      visit root_path
      find('li', class: 'dropdown', text: I18n.t('btn.account')).click
      find('ul', class: 'dropdown-menu').find('a', text: I18n.t('settings.settings')).click
      expect(page).to have_content I18n.t('settings.settings')
      expect(page).to have_current_path edit_user_registration_path
    end
  end

  describe 'billing address' do
    context 'when valid input' do
      it do
        visit edit_user_registration_path
        fill_in 'user_billing_address_attributes_first_name', with: valid_str
        fill_in 'user_billing_address_attributes_last_name', with: valid_str
        fill_in 'user_billing_address_attributes_address', with: valid_str
        fill_in 'user_billing_address_attributes_city', with: valid_str
        fill_in 'user_billing_address_attributes_zip', with: valid_zip
        fill_in 'user_billing_address_attributes_phone', with: valid_phone
        find('input', class: 'BillingAddress').click
        expect(page).to have_selector '.flash', text: I18n.t('settings.address.success_update')
      end
    end

    context 'when invalid input' do
      it do
        visit edit_user_registration_path
        fill_in 'user_billing_address_attributes_first_name', with: empty
        fill_in 'user_billing_address_attributes_last_name', with: empty
        fill_in 'user_billing_address_attributes_address', with: empty
        fill_in 'user_billing_address_attributes_city', with: empty
        fill_in 'user_billing_address_attributes_zip', with: empty
        fill_in 'user_billing_address_attributes_phone', with: empty
        find('input', class: 'BillingAddress').click
        expect(page).to have_selector('.invalid-feedback', count: 6)
      end
    end
  end

  describe 'shipping address' do
    context 'when valid input' do
      it do
        visit edit_user_registration_path
        fill_in 'user_shipping_address_attributes_first_name', with: valid_str
        fill_in 'user_shipping_address_attributes_last_name', with: valid_str
        fill_in 'user_shipping_address_attributes_address', with: valid_str
        fill_in 'user_shipping_address_attributes_city', with: valid_str
        fill_in 'user_shipping_address_attributes_zip', with: valid_zip
        fill_in 'user_shipping_address_attributes_phone', with: valid_phone
        find('input', class: 'ShippingAddress').click
        expect(page).to have_selector '.flash', text: I18n.t('settings.address.success_update')
      end
    end

    context 'when invalid input' do
      it do
        visit edit_user_registration_path
        fill_in 'user_shipping_address_attributes_first_name', with: empty
        fill_in 'user_shipping_address_attributes_last_name', with: empty
        fill_in 'user_shipping_address_attributes_address', with: empty
        fill_in 'user_shipping_address_attributes_city', with: empty
        fill_in 'user_shipping_address_attributes_zip', with: empty
        fill_in 'user_shipping_address_attributes_phone', with: empty
        find('input', class: 'ShippingAddress').click
        expect(page).to have_selector('.invalid-feedback', count: 6)
      end
    end
  end

  describe 'privacy' do
    describe 'Change email' do
      context 'when valid' do
        it do
          visit edit_user_registration_path
          find('a', text: I18n.t('settings.address.privacy')).click
          fill_in 'user_email', with: new_email
          find('input', class: 'email-btn').click
          expect(page).to have_current_path edit_user_registration_path
          expect(page).to have_selector '.flash', text: I18n.t('devise.registrations.updated')
          expect(User.find_by(id: user.id).email).to eq(new_email)
        end
      end

      context 'when invalid' do
        it do
          visit edit_user_registration_path
          find('a', text: I18n.t('settings.address.privacy')).click
          fill_in 'user_email', with: empty
          find('input', class: 'email-btn').click
          expect(page).to have_current_path user_registration_path
          expect(page).to have_selector '.flash', text: I18n.t('settings.danger_update_email')
        end
      end
    end

    describe 'Change password' do
      context 'when invalid' do
        it do
          visit edit_user_registration_path
          find('a', text: I18n.t('settings.address.privacy')).click
          within('.divider-lg-bottom') do
            fill_in 'user_current_password', with: user.password
            fill_in 'user_password', with: '12345'
            fill_in 'user_password_confirmation', with: '123456'
          end
          find('input', class: 'password-btn').click
          expect(page).to have_current_path user_registration_path
          expect(page).to have_selector 'div', text: I18n.t('settings.danger_update_password')
        end
      end

      context 'when valid' do
        it do
          visit edit_user_registration_path
          find('a', text: I18n.t('settings.address.privacy')).click
          within('.divider-lg-bottom') do
            fill_in 'user_current_password', with: user.password
            fill_in 'user_password', with: '123456'
            fill_in 'user_password_confirmation', with: '123456'
          end
          find('input', class: 'password-btn').click
          expect(page).to have_current_path edit_user_registration_path
          expect(page).to have_selector 'div', text: I18n.t('devise.registrations.updated')
        end
      end
    end

    describe 'Destroy account' do
      it do
        visit edit_user_registration_path
        find('a', text: I18n.t('settings.address.privacy')).click
        expect(page).to have_css('#button_delete_account.disabled')
        find('label', class: 'checkbox-label').click
        find('a', text: 'Please Remove My Account').click
        expect(page).to have_current_path root_path
        expect(page).to have_selector '.flash', text: I18n.t('devise.registrations.destroyed')
      end
    end
  end
end
