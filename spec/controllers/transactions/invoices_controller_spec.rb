require "rails_helper"

RSpec.describe Api::V1::Transactions::InvoicesController, type: :controller do
  describe "GET #show.json" do
    let(:json_response) { JSON.parse(response.body) }
    let(:transaction) { create(:transaction) }
    let(:invoice) { transaction.invoice }

    it "responds with successful 200 HTTP status code" do
      get :show, transaction_id: transaction.id, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns the transaction's associated invoice in JSON format" do
      get :show, transaction_id: transaction.id, format: :json

      expect(json_response["id"]).to eq(invoice.id)
      expect(json_response["merchant_id"]).to eq(invoice.merchant_id)
      expect(json_response["customer_id"]).to eq(invoice.customer_id)
      expect(json_response["status"]).to eq(invoice.status)
      expect(json_response["updated_at"].to_json).to eq(invoice.updated_at.to_json)
      expect(json_response["created_at"].to_json).to eq(invoice.created_at.to_json)
    end
  end
end
