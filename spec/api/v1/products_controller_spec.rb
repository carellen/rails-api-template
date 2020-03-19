RSpec.describe Api::V1::ProductsController, type: :controller do

  describe 'GET #index' do
    let!(:products) { create_list :product, 5 }

    before(:each) { get :index }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns all products' do
      expect(json_response.size).to eq 5
    end

    it 'returns products list' do
      product = products.first
      product_from_response = json_response.detect { |p| p[:id] == product.id }
      expect(product.name).to eq product_from_response[:name]
    end
  end
end
