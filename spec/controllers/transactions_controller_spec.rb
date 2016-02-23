require "rails_helper"

RSpec.describe Api::V1::TransactionsController, type: :controller do
  describe "GET #index.json" do
    let(:json_response) { JSON.parse(response.body)["transactions"] }

    it "responds with successful 200 HTTP status code" do
      get :index, format: :json

      expect(response).to be_success
    end

    it "returns all of the customers in JSON format" do
      transactions = create_list(:transaction, 2)
      get :index, format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["id"]).to eq(transactions.first.id)
      expect(json_response.first["invoice_id"]).to eq(transactions.first.invoice_id)
      expect(json_response.last["id"]).to eq(transactions.last.id)
      expect(json_response.last["invoice_id"]).to eq(transactions.last.invoice_id)
    end
  end
end
