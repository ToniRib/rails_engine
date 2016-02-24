require "rails_helper"

RSpec.describe Api::V1::InvoiceItems::ItemsController, type: :controller do
  describe "GET #show.json" do
    let(:json_response) { JSON.parse(response.body) }
    let(:invoice_item) { create(:invoice_item) }
    let(:item) { invoice_item.item }

    it "responds with successful 200 HTTP status code" do
      get :show, invoice_item_id: invoice_item.id, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns the info for the invoice item's item in JSON format" do
      get :show, invoice_item_id: invoice_item.id, format: :json

      expect(json_response["id"]).to eq(item.id)
      expect(json_response["name"]).to eq(item.name)
      expect(json_response["description"]).to eq(item.description)
      expect(json_response["unit_price"]).to eq(item.unit_price.to_s)
      expect(json_response["merchant_id"]).to eq(item.merchant_id)
      expect(json_response["updated_at"].to_json).to eq(item.updated_at.to_json)
      expect(json_response["created_at"].to_json).to eq(item.created_at.to_json)
    end
  end
end
