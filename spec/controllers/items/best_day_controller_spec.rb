require "rails_helper"

RSpec.describe Api::V1::Items::BestDayController, type: :controller do
  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "responds with successful 200 HTTP status code" do
      merchant1, merchant2, merchant3 = load_merchants_with_transactions
      item1 = merchant1.items.first

      get :show, item_id: item1.id, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns a merchant's favorite cutomer" do
      merchant1, merchant2, merchant3 = load_merchants_with_transactions
      item1 = merchant1.items.first

      get :show, item_id: item1.id, format: :json

      expect(json_response['best_day']).to eq("2016-02-23T00:00:00.000Z")
    end
  end
end
