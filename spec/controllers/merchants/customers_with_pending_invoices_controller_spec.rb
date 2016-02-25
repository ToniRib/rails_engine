require "rails_helper"

RSpec.describe Api::V1::Merchants::CustomersWithPendingInvoicesController, type: :controller do
  describe "GET #index" do
    let(:json_response) { JSON.parse(response.body) }

    it "responds with successful 200 HTTP status code" do
      merchant1, merchant2, merchant3 = load_merchants_with_transactions

      get :index, merchant_id: merchant1.id, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns a list of customers with pending invoices" do
      merchant1, merchant2, merchant3 = load_merchants_with_transactions
      customer = merchant1.customers.first
      customer.transactions.first.update_attribute(:result, "failed")

      get :index, merchant_id: merchant1.id, format: :json

      expect(json_response.first['id']).to eq(customer.id)
    end
  end
end
