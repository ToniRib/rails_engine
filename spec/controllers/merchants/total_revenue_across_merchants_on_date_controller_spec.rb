require "rails_helper"

RSpec.describe Api::V1::Merchants::TotalRevenueAcrossMerchantsOnDateController, type: :controller do
  describe "GET #show.json" do
    let(:json_response) { JSON.parse(response.body) }

    it "responds with successful 200 HTTP status code" do
      get :show, date: Date.today, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns all of the merchant's items in JSON format" do
      merchant1, merchant2, merchant3 = load_merchants_with_transactions

      get :show, date: Date.today, format: :json

      expect(json_response["total_revenue"].to_f).to eq(1800.00)
    end
  end
end
