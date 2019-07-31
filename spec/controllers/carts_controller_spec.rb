RSpec.describe CartsController, type: :controller do

  describe '#show' do
    it do
      get :show
      expect(response).to be_successful
      expect(assigns(:order_items)).to be_kind_of(Draper::CollectionDecorator)
    end
  end

  describe '#checkout' do

    context 'with order items' do
      let(:order) { create(:order, :with_order_item) }

      it do
        allow(Orders::Check).to receive(:call).and_return(double(order: order))
        get :checkout
        expect(response.status).to eq(302)
        expect(order.status).to eq("fill_address")
        expect(response).to redirect_to(checkout_fill_address_path)
      end
    end

    context 'with order items' do
      let(:order) { create(:order) }

      it do
        allow(Orders::Check).to receive(:call).and_return(double(order: order))
        get :checkout
        expect(response.status).to eq(302)
        expect(order.status).to eq("cart")
        expect(response).to redirect_to(books_path)
      end
    end
  end
end
