require "rails_helper"

RSpec.describe Api::V1::TransactionsController, type: :controller do
  describe "GET #index.json" do
    let(:json_response) { JSON.parse(response.body)["transactions"] }

    it "responds with successful 200 HTTP status code" do
      get :index, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
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

  describe "GET #show.json" do
    let(:json_response) { JSON.parse(response.body) }
    let(:transaction) { create(:transaction) }

    it "responds with successful 200 HTTP status code" do
      get :show, id: transaction.id, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns the specific transaction in JSON format" do
      get :show, id: transaction.id, format: :json

      expect(json_response["id"]).to eq(transaction.id)
      expect(json_response["invoice_id"]).to eq(transaction.invoice_id)
      expect(json_response["credit_card_number"]).to eq(transaction.credit_card_number)
      expect(json_response["result"]).to eq(transaction.result)
    end
  end
end
