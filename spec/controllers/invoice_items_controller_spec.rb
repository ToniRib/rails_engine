require "rails_helper"

RSpec.describe Api::V1::InvoiceItemsController, type: :controller do
  describe "GET #index.json" do
    let(:json_response) { JSON.parse(response.body)["invoice_items"] }

    it "responds with successful 200 HTTP status code" do
      get :index, format: :json

      expect(response).to be_success
    end

    it "returns all of the customers in JSON format" do
      invoice_items = create_list(:invoice_item, 2)
      get :index, format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["id"]).to eq(invoice_items.first.id)
      expect(json_response.first["item_id"]).to eq(invoice_items.first.item_id)
      expect(json_response.last["id"]).to eq(invoice_items.last.id)
      expect(json_response.last["item_id"]).to eq(invoice_items.last.item_id)
    end
  end
end
