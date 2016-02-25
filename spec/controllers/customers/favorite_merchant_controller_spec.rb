require "rails_helper"

RSpec.describe Api::V1::Customers::FavoriteMerchantController, type: :controller do
  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "responds with successful 200 HTTP status code" do
      merchant1, merchant2, merchant3 = load_merchants_with_transactions
      customer1 = merchant1.customers.first

      get :show, customer_id: customer1.id, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns a merchant's favorite cutomer" do
      merchant1, merchant2, merchant3 = load_merchants_with_transactions
      customer1 = merchant1.customers.first

      get :show, customer_id: customer1.id, format: :json

      expect(json_response['id']).to eq(merchant1.id)
      expect(json_response['name']).to eq(merchant1.name)
    end
  end
end
