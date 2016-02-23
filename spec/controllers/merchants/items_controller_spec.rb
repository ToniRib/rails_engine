require "rails_helper"

RSpec.describe Api::V1::Merchants::ItemsController, type: :controller do
  describe "GET #index.json" do
    let(:json_response) { JSON.parse(response.body) }
    let(:merchant) { create(:merchant) }
    let(:items) { create_list(:item, 2)}

    it "responds with successful 200 HTTP status code" do
      merchant.items << items
      get :index, merchant_id: merchant.id, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns all of the merchant's items in JSON format" do
      merchant.items << items
      get :index, merchant_id: merchant.id, format: :json

      expect(json_response.count).to eq(2)

      expect(json_response.first["id"]).to eq(items.first.id)
      expect(json_response.first["name"]).to eq(items.first.name)
      expect(json_response.first["description"]).to eq(items.first.description)
      expect(json_response.first["unit_price"]).to eq(items.first.unit_price)
      expect(json_response.first["merchant_id"]).to eq(items.first.merchant_id)
      expect(json_response.first["updated_at"].to_json).to eq(items.first.updated_at.to_json)
      expect(json_response.first["created_at"].to_json).to eq(items.first.created_at.to_json)

      expect(json_response.last["id"]).to eq(items.last.id)
      expect(json_response.last["name"]).to eq(items.last.name)
      expect(json_response.last["description"]).to eq(items.last.description)
      expect(json_response.last["unit_price"]).to eq(items.last.unit_price)
      expect(json_response.last["merchant_id"]).to eq(items.last.merchant_id)
      expect(json_response.last["updated_at"].to_json).to eq(items.last.updated_at.to_json)
      expect(json_response.last["created_at"].to_json).to eq(items.last.created_at.to_json)
    end
  end
end
