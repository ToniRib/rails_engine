require "rails_helper"

RSpec.describe Api::V1::Items::TopItemsByMostSoldController, type: :controller do
  describe "GET #index.json" do
    let(:json_response) { JSON.parse(response.body) }

    it "responds with successful 200 HTTP status code" do
      get :index, quantity: 2, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns all of the merchant's items in JSON format" do
      merchant1, merchant2, merchant3 = load_merchants_with_transactions
      item3 = merchant3.items.first
      item2 = merchant2.items.first

      get :index, quantity: 2, format: :json

      expect(json_response.first["id"]).to eq(item3.id)
      expect(json_response.last["id"]).to eq(item2.id)
    end
  end
end
