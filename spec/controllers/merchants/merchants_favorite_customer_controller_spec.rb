require "rails_helper"

RSpec.describe Api::V1::Merchants::MerchantsFavoriteCustomerController, type: :controller do
  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "responds with successful 200 HTTP status code" do
      merchant1, merchant2, merchant3 = load_merchants_with_transactions

      get :show, merchant_id: merchant1.id, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns a merchant's favorite cutomer" do
      merchant1, merchant2, merchant3 = load_merchants_with_transactions

      get :show, merchant_id: merchant1.id, format: :json
      expect(json_response['id']).to eq(Customer.first.id)
    end
  end
end
