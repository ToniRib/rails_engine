require "rails_helper"

RSpec.describe Api::V1::Invoices::InvoiceItemsController, type: :controller do
  describe "GET #index.json" do
    let(:json_response) { JSON.parse(response.body) }
    let(:invoice) { create(:invoice) }
    let(:invoice_items) { create_list(:invoice_item, 2) }

    it "responds with successful 200 HTTP status code" do
      invoice.invoice_items << invoice_items
      get :index, invoice_id: invoice.id, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns all of the invoice's invoice items in JSON format" do
      invoice.invoice_items << invoice_items
      get :index, invoice_id: invoice.id, format: :json

      expect(json_response.count).to eq(2)

      expect(json_response.first["id"]).to eq(invoice_items.first.id)
      expect(json_response.first["item_id"]).to eq(invoice_items.first.item_id)
      expect(json_response.first["invoice_id"]).to eq(invoice_items.first.invoice_id)
      expect(json_response.first["quantity"]).to eq(invoice_items.first.quantity)
      expect(json_response.first["unit_price"]).to eq(invoice_items.first.unit_price)
      expect(json_response.first["updated_at"].to_json).to eq(invoice_items.first.updated_at.to_json)
      expect(json_response.first["created_at"].to_json).to eq(invoice_items.first.created_at.to_json)

      expect(json_response.last["id"]).to eq(invoice_items.last.id)
      expect(json_response.last["item_id"]).to eq(invoice_items.last.item_id)
      expect(json_response.last["invoice_id"]).to eq(invoice_items.last.invoice_id)
      expect(json_response.last["quantity"]).to eq(invoice_items.last.quantity)
      expect(json_response.last["unit_price"]).to eq(invoice_items.last.unit_price)
      expect(json_response.last["updated_at"].to_json).to eq(invoice_items.last.updated_at.to_json)
      expect(json_response.last["created_at"].to_json).to eq(invoice_items.last.created_at.to_json)
    end
  end
end
