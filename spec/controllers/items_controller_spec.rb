require "rails_helper"

RSpec.describe Api::V1::ItemsController, type: :controller do
  describe "GET #index.json" do
    let(:json_response) { JSON.parse(response.body)["items"] }

    it "responds with successful 200 HTTP status code" do
      get :index, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns all of the customers in JSON format" do
      items = create_list(:item, 2)
      get :index, format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["name"]).to eq(items.first.name)
      expect(json_response.first["id"]).to eq(items.first.id)
      expect(json_response.last["name"]).to eq(items.last.name)
      expect(json_response.last["id"]).to eq(items.last.id)
    end
  end

  describe "GET #show.json" do
    let(:json_response) { JSON.parse(response.body) }
    let(:item) { create(:item) }

    it "responds with successful 200 HTTP status code" do
      get :show, id: item.id, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns the specific item in JSON format" do
      get :show, id: item.id, format: :json

      expect(json_response["id"]).to eq(item.id)
      expect(json_response["description"]).to eq(item.description)
      expect(json_response["unit_price"]).to eq(item.unit_price)
      expect(json_response["merchant_id"]).to eq(item.merchant_id)
    end
  end
end
