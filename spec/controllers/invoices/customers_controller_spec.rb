require "rails_helper"

RSpec.describe Api::V1::Invoices::CustomersController, type: :controller do
  describe "GET #show.json" do
    let(:json_response) { JSON.parse(response.body) }
    let(:invoice) { create(:invoice) }
    let(:customer) { invoice.customer }

    it "responds with successful 200 HTTP status code" do
      get :show, invoice_id: invoice.id, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns the info for the invoice's customer in JSON format" do
      get :show, invoice_id: invoice.id, format: :json

      expect(json_response["id"]).to eq(customer.id)
      expect(json_response["first_name"]).to eq(customer.first_name)
      expect(json_response["last_name"]).to eq(customer.last_name)
      expect(json_response["updated_at"].to_json).to eq(customer.updated_at.to_json)
      expect(json_response["created_at"].to_json).to eq(customer.created_at.to_json)
    end
  end
end
