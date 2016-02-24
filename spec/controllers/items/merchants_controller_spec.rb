require "rails_helper"

RSpec.describe Api::V1::Items::MerchantsController, type: :controller do
  describe "GET #show.json" do
    let(:json_response) { JSON.parse(response.body) }
    let(:item) { create(:item) }
    let(:merchant) { item.merchant }

    it "responds with successful 200 HTTP status code" do
      get :show, item_id: item.id, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns the info for the item's merchant in JSON format" do
      get :show, item_id: item.id, format: :json

      expect(json_response["id"]).to eq(merchant.id)
      expect(json_response["name"]).to eq(merchant.name)
      expect(json_response["updated_at"].to_json).to eq(merchant.updated_at.to_json)
      expect(json_response["created_at"].to_json).to eq(merchant.created_at.to_json)
    end
  end
end
