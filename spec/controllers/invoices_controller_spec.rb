require "rails_helper"

RSpec.describe Api::V1::InvoicesController, type: :controller do
  describe "GET #index.json" do
    let(:json_response) { JSON.parse(response.body)["invoices"] }

    it "responds with successful 200 HTTP status code" do
      get :index, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns all of the customers in JSON format" do
      invoices = create_list(:invoice, 2)
      get :index, format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["id"]).to eq(invoices.first.id)
      expect(json_response.first["customer_id"]).to eq(invoices.first.customer_id)
      expect(json_response.last["id"]).to eq(invoices.last.id)
      expect(json_response.last["customer_id"]).to eq(invoices.last.customer_id)
    end
  end

  describe "GET #show.json" do
    let(:json_response) { JSON.parse(response.body) }
    let(:invoice) { create(:invoice) }

    it "responds with successful 200 HTTP status code" do
      get :show, id: invoice.id, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns the specific invoice in JSON format" do
      get :show, id: invoice.id, format: :json

      expect(json_response["id"]).to eq(invoice.id)
      expect(json_response["customer_id"]).to eq(invoice.customer_id)
      expect(json_response["merchant_id"]).to eq(invoice.merchant_id)
      expect(json_response["status"]).to eq(invoice.status)
    end
  end
end
