require "rails_helper"

RSpec.describe Api::V1::Merchants::RevenuesController, type: :controller do
  describe "GET #show.json" do
    let(:json_response) { JSON.parse(response.body) }

    it "responds with successful 200 HTTP status code" do
      merchant1, merchant2, merchant3 = load_merchants_with_transactions
      get :show, merchant_id: merchant1.id, date: Date.today, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns all of the merchant's items in JSON format" do
      merchant1, merchant2, merchant3 = load_merchants_with_transactions

      get :show, merchant_id: merchant1.id, date: Date.today - 1, format: :json

      expect(json_response["revenue"].to_f).to eq(200.00)
    end
  end
end
