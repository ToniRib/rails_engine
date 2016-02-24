require "rails_helper"

RSpec.describe Api::V1::Customers::InvoicesController, type: :controller do
  describe "GET #index.json" do
    let(:json_response) { JSON.parse(response.body) }
    let(:customer) { create(:customer) }
    let(:invoices) { create_list(:invoice, 2) }

    it "responds with successful 200 HTTP status code" do
      customer.invoices << invoices
      get :index, customer_id: customer.id, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns all of the customer's invoices in JSON format" do
      customer.invoices << invoices
      get :index, customer_id: customer.id, format: :json

      expect(json_response.count).to eq(2)

      expect(json_response.first["id"]).to eq(invoices.first.id)
      expect(json_response.first["merchant_id"]).to eq(invoices.first.merchant_id)
      expect(json_response.first["customer_id"]).to eq(invoices.first.customer_id)
      expect(json_response.first["status"]).to eq(invoices.first.status)
      expect(json_response.first["updated_at"].to_json).to eq(invoices.first.updated_at.to_json)
      expect(json_response.first["created_at"].to_json).to eq(invoices.first.created_at.to_json)

      expect(json_response.last["id"]).to eq(invoices.last.id)
      expect(json_response.last["merchant_id"]).to eq(invoices.last.merchant_id)
      expect(json_response.last["customer_id"]).to eq(invoices.last.customer_id)
      expect(json_response.last["status"]).to eq(invoices.last.status)
      expect(json_response.last["updated_at"].to_json).to eq(invoices.last.updated_at.to_json)
      expect(json_response.last["created_at"].to_json).to eq(invoices.last.created_at.to_json)
    end
  end
end
