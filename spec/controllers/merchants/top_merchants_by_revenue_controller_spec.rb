require "rails_helper"

RSpec.describe Api::V1::Merchants::TopMerchantsByRevenueController, type: :controller do
  describe "GET #index.json" do
    let(:json_response) { JSON.parse(response.body) }

    it "responds with successful 200 HTTP status code" do
      get :index, quantity: 3, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    xit "returns all of the merchant's items in JSON format" do
      set_up_merchants_with_transactions

      get :index, quantity: 3, format: :json

    end
  end
end
