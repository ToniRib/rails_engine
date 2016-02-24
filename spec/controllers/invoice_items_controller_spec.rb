require "rails_helper"

RSpec.describe Api::V1::InvoiceItemsController, type: :controller do
  describe "GET #index.json" do
    let(:json_response) { JSON.parse(response.body) }

    it "responds with successful 200 HTTP status code" do
      get :index, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns all of the invoice items in JSON format" do
      invoice_items = create_list(:invoice_item, 2)
      get :index, format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["id"]).to eq(invoice_items.first.id)
      expect(json_response.first["item_id"]).to eq(invoice_items.first.item_id)
      expect(json_response.last["id"]).to eq(invoice_items.last.id)
      expect(json_response.last["item_id"]).to eq(invoice_items.last.item_id)
    end
  end

  describe "GET #index.json with id" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all of the invoice items in JSON format" do
      invoice_items = create_list(:invoice_item, 2)
      get :index, id: invoice_items.first.id, format: :json

      expect(json_response.count).to eq(1)
      expect(json_response.first["id"]).to eq(invoice_items.first.id)
      expect(json_response.first["item_id"]).to eq(invoice_items.first.item_id)
    end
  end

  describe "GET #index.json with item_id" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all of the invoice items in JSON format" do
      item = create(:item)
      invoice_items = create_list(:invoice_item, 2, item_id: item.id)
      get :index, item_id: item.id, format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["id"]).to eq(invoice_items.first.id)
      expect(json_response.first["item_id"]).to eq(item.id)
      expect(json_response.last["id"]).to eq(invoice_items.last.id)
      expect(json_response.last["item_id"]).to eq(item.id)
    end
  end

  describe "GET #index.json with invoice_id" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all of the invoice items in JSON format" do
      invoice = create(:invoice)
      invoice_items = create_list(:invoice_item, 2, invoice_id: invoice.id)
      get :index, invoice_id: invoice.id, format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["id"]).to eq(invoice_items.first.id)
      expect(json_response.first["invoice_id"]).to eq(invoice.id)
      expect(json_response.last["id"]).to eq(invoice_items.last.id)
      expect(json_response.last["invoice_id"]).to eq(invoice.id)
    end
  end

  describe "GET #index.json with quantity" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all of the invoice items in JSON format" do
      invoice_items = create_list(:invoice_item, 2, quantity: 2)
      get :index, quantity: 2, format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["id"]).to eq(invoice_items.first.id)
      expect(json_response.first["quantity"]).to eq(2)
      expect(json_response.last["id"]).to eq(invoice_items.last.id)
      expect(json_response.last["quantity"]).to eq(2)
    end
  end

  describe "GET #index.json with unit_price" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all of the invoice items in JSON format" do
      invoice_items = create_list(:invoice_item, 2, unit_price: "123.45")
      get :index, unit_price: "123.45", format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["id"]).to eq(invoice_items.first.id)
      expect(json_response.first["unit_price"]).to eq("123.45")
      expect(json_response.last["id"]).to eq(invoice_items.last.id)
      expect(json_response.last["unit_price"]).to eq("123.45")
    end
  end

  describe "GET #index.json with unit_price" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all of the invoice items in JSON format" do
      invoice_items = create_list(:invoice_item, 2)
      get :index, created_at: Date.today, format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["id"]).to eq(invoice_items.first.id)
      expect(json_response.first["quantity"]).to eq(invoice_items.first.quantity)
      expect(json_response.last["id"]).to eq(invoice_items.last.id)
      expect(json_response.last["quantity"]).to eq(invoice_items.last.quantity)
    end
  end

  describe "GET #index.json with unit_price" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all of the invoice items in JSON format" do
      invoice_items = create_list(:invoice_item, 2)
      get :index, updated_at: Date.today, format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["id"]).to eq(invoice_items.first.id)
      expect(json_response.first["quantity"]).to eq(invoice_items.first.quantity)
      expect(json_response.last["id"]).to eq(invoice_items.last.id)
      expect(json_response.last["quantity"]).to eq(invoice_items.last.quantity)
    end
  end

  describe "GET #show.json with id" do
    let(:json_response) { JSON.parse(response.body) }
    let(:invoice_items) { create_list(:invoice_item, 2) }
    let(:invoice_item) { invoice_items.first }

    it "responds with successful 200 HTTP status code" do
      get :show, id: invoice_item.id, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns the specific invoice_item in JSON format" do
      get :show, id: invoice_item.id, format: :json

      expect(json_response["id"]).to eq(invoice_item.id)
      expect(json_response["item_id"]).to eq(invoice_item.item_id)
      expect(json_response["invoice_id"]).to eq(invoice_item.invoice_id)
      expect(json_response["quantity"]).to eq(invoice_item.quantity)
      expect(json_response["unit_price"]).to eq(invoice_item.unit_price.to_s)
    end
  end

  describe "GET #show.json with item_id" do
    let(:json_response) { JSON.parse(response.body) }
    let(:invoice_items) { create_list(:invoice_item, 2) }
    let(:invoice_item) { invoice_items.first }

    it "returns the specific invoice_item in JSON format" do
      get :show, item_id: invoice_item.item_id, format: :json

      expect(json_response["id"]).to eq(invoice_item.id)
      expect(json_response["item_id"]).to eq(invoice_item.item_id)
      expect(json_response["invoice_id"]).to eq(invoice_item.invoice_id)
      expect(json_response["quantity"]).to eq(invoice_item.quantity)
      expect(json_response["unit_price"]).to eq(invoice_item.unit_price.to_s)
    end
  end

  describe "GET #show.json with invoice_id" do
    let(:json_response) { JSON.parse(response.body) }
    let(:invoice_items) { create_list(:invoice_item, 2) }
    let(:invoice_item) { invoice_items.first }

    it "returns the specific invoice_item in JSON format" do
      get :show, invoice_id: invoice_item.invoice_id, format: :json

      expect(json_response["id"]).to eq(invoice_item.id)
      expect(json_response["item_id"]).to eq(invoice_item.item_id)
      expect(json_response["invoice_id"]).to eq(invoice_item.invoice_id)
      expect(json_response["quantity"]).to eq(invoice_item.quantity)
      expect(json_response["unit_price"]).to eq(invoice_item.unit_price.to_s)
    end
  end

  describe "GET #show.json with quantity" do
    let(:json_response) { JSON.parse(response.body) }
    let(:invoice_items) { create_list(:invoice_item, 2) }
    let(:invoice_item) { invoice_items.first }

    it "returns the specific invoice_item in JSON format" do
      get :show, quantity: invoice_item.quantity, format: :json

      expect(json_response["id"]).to eq(invoice_item.id)
      expect(json_response["item_id"]).to eq(invoice_item.item_id)
      expect(json_response["invoice_id"]).to eq(invoice_item.invoice_id)
      expect(json_response["quantity"]).to eq(invoice_item.quantity)
      expect(json_response["unit_price"]).to eq(invoice_item.unit_price.to_s)
    end
  end

  describe "GET #show.json with unit_price" do
    let(:json_response) { JSON.parse(response.body) }
    let(:invoice_items) { create_list(:invoice_item, 2) }
    let(:invoice_item) { invoice_items.first }

    it "returns the specific invoice_item in JSON format" do
      get :show, unit_price: invoice_item.unit_price.to_s, format: :json

      expect(json_response["id"]).to eq(invoice_item.id)
      expect(json_response["item_id"]).to eq(invoice_item.item_id)
      expect(json_response["invoice_id"]).to eq(invoice_item.invoice_id)
      expect(json_response["quantity"]).to eq(invoice_item.quantity)
      expect(json_response["unit_price"]).to eq(invoice_item.unit_price.to_s)
    end
  end

  describe "GET #show.json with created_at" do
    let(:json_response) { JSON.parse(response.body) }
    let(:invoice_items) { create_list(:invoice_item, 2) }
    let(:invoice_item) { invoice_items.first }

    it "returns the specific invoice_item in JSON format" do
      get :show, created_at: invoice_item.created_at.to_json, format: :json

      expect(json_response["id"]).to eq(invoice_item.id)
      expect(json_response["item_id"]).to eq(invoice_item.item_id)
      expect(json_response["invoice_id"]).to eq(invoice_item.invoice_id)
      expect(json_response["quantity"]).to eq(invoice_item.quantity)
      expect(json_response["unit_price"]).to eq(invoice_item.unit_price.to_s)
    end
  end

  describe "GET #show.json with updated_at" do
    let(:json_response) { JSON.parse(response.body) }
    let(:invoice_items) { create_list(:invoice_item, 2) }
    let(:invoice_item) { invoice_items.first }

    it "returns the specific invoice_item in JSON format" do
      get :show, updated_at: invoice_item.updated_at.to_json, format: :json

      expect(json_response["id"]).to eq(invoice_item.id)
      expect(json_response["item_id"]).to eq(invoice_item.item_id)
      expect(json_response["invoice_id"]).to eq(invoice_item.invoice_id)
      expect(json_response["quantity"]).to eq(invoice_item.quantity)
      expect(json_response["unit_price"]).to eq(invoice_item.unit_price.to_s)
    end
  end
end
