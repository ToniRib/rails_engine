require "rails_helper"

RSpec.describe Api::V1::MerchantsController, type: :controller do
  describe "GET #index.json" do
    let(:json_response) { JSON.parse(response.body)["merchants"] }

    it "responds with successful 200 HTTP status code" do
      get :index, format: :json

      expect(response).to be_success
    end

    it "returns all of the merchants in JSON format" do
      merchants = create_list(:merchant, 2)
      get :index, format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["name"]).to eq(merchants.first.name)
      expect(json_response.first["id"]).to eq(merchants.first.id)
      expect(json_response.last["name"]).to eq(merchants.last.name)
      expect(json_response.last["id"]).to eq(merchants.last.id)
    end
  end
end
