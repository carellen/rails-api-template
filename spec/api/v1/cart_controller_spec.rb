RSpec.describe Api::V1::CartController, type: :controller do

  describe 'GET #show' do
    let!(:first_product) { create :product, price: 5 }
    let!(:second_product) { create :product, price: 10 }
    let(:empty_cart) { { total_sum: 0, products_count: 0, products: [] } }
    let(:cart_with_products) do
      {
        total_sum: 25,
        products_count: 3,
        products: [
          {
            id: first_product.id,
            quantity: 1,
            sum: 5
          },
          {
            id: second_product.id,
            quantity: 2,
            sum: 20
          }
        ]
      }
    end

    it 'returns empty cart if no products added' do
      get :show
      expect(json_response).to eq empty_cart
    end

    it 'returns cart with proper products' do
      session[:cart] = Hash[first_product.id, 1, second_product.id, 2]
      get :show
      expect(json_response).to eq cart_with_products
    end
  end

  describe 'POST #create' do
    let!(:product) { create :product }

    it 'add product to cart' do
      post :create, params: { product_id: product.id, quantity: 3 }
      expect(response).to have_http_status(:success)
      expect(session[:cart]).to eq(Hash[product.id, 3])
    end

    it 'add sum products properly' do
      post :create, params: { product_id: product.id, quantity: 3 }
      post :create, params: { product_id: product.id, quantity: 3 }
      expect(session[:cart]).to eq(Hash[product.id, 6])
    end
  end

  describe 'DELETE #destroy' do
    let!(:product) { create :product }

    it 'remove product from cart' do
      post :create, params: { product_id: product.id, quantity: 1 }
      delete :destroy, params: { product_id: product.id }
      expect(response).to have_http_status(:success)
      expect(session[:cart]).to eq({})
    end

    it 'subtract product if more than one' do
      post :create, params: { product_id: product.id, quantity: 2 }
      delete :destroy, params: { product_id: product.id }
      expect(session[:cart]).to eq(Hash[product.id, 1])
    end
  end
end
