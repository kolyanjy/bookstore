RSpec.describe Users::AddressesController, type: :controller do
  subject(:controller) { described_class.new }

  let(:valid_params) {
          first_name: 'valid_input', last_name: 'valid_input', address: 'valid_input', city: 'valid_input', zip: 345,
          country: 'valid_input', phone: 'valid_phone', type: 'BillingAddress'
        }

end
