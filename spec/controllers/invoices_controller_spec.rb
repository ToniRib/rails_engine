require "rails_helper"

RSpec.describe Api::V1::InvoicesController, type: :controller do
  describe "GET #index.json" do
    let(:json_response) { JSON.parse(response.body)["invoices"] }

    it "responds with successful 200 HTTP status code" do
      get :index, format: :json

      expect(response).to be_success
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
end
