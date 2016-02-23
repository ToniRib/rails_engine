require "rails_helper"

RSpec.describe Api::V1::Invoices::TransactionsController, type: :controller do
  describe "GET #index.json" do
    let(:json_response) { JSON.parse(response.body) }
    let(:invoice) { create(:invoice) }
    let(:transactions) { create_list(:transaction, 2) }

    it "responds with successful 200 HTTP status code" do
      invoice.transactions << transactions
      get :index, invoice_id: invoice.id, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns all of the invoice's transactions in JSON format" do
      invoice.transactions << transactions
      get :index, invoice_id: invoice.id, format: :json

      expect(json_response.count).to eq(2)

      expect(json_response.first["id"]).to eq(transactions.first.id)
      expect(json_response.first["invoice_id"]).to eq(transactions.first.invoice_id)
      expect(json_response.first["credit_card_number"]).to eq(transactions.first.credit_card_number)
      expect(json_response.first["result"]).to eq(transactions.first.result)
      expect(json_response.first["updated_at"].to_json).to eq(transactions.first.updated_at.to_json)
      expect(json_response.first["created_at"].to_json).to eq(transactions.first.created_at.to_json)

      expect(json_response.last["id"]).to eq(transactions.last.id)
      expect(json_response.last["invoice_id"]).to eq(transactions.last.invoice_id)
      expect(json_response.last["credit_card_number"]).to eq(transactions.last.credit_card_number)
      expect(json_response.last["result"]).to eq(transactions.last.result)
      expect(json_response.last["updated_at"].to_json).to eq(transactions.last.updated_at.to_json)
      expect(json_response.last["created_at"].to_json).to eq(transactions.last.created_at.to_json)
    end
  end
end
