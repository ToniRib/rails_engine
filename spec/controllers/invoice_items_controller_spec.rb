require "rails_helper"

RSpec.describe Api::V1::InvoiceItemsController, type: :controller do
  describe "GET #index.json" do
    let(:json_response) { JSON.parse(response.body)["invoice_items"] }

    it "responds with successful 200 HTTP status code" do
      get :index, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
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
      expect(json_response["unit_price"]).to eq(invoice_item.unit_price)
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
      expect(json_response["unit_price"]).to eq(invoice_item.unit_price)
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
      expect(json_response["unit_price"]).to eq(invoice_item.unit_price)
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
      expect(json_response["unit_price"]).to eq(invoice_item.unit_price)
    end
  end

  describe "GET #show.json with unit_price" do
    let(:json_response) { JSON.parse(response.body) }
    let(:invoice_items) { create_list(:invoice_item, 2) }
    let(:invoice_item) { invoice_items.first }

    it "returns the specific invoice_item in JSON format" do
      get :show, unit_price: invoice_item.unit_price, format: :json

      expect(json_response["id"]).to eq(invoice_item.id)
      expect(json_response["item_id"]).to eq(invoice_item.item_id)
      expect(json_response["invoice_id"]).to eq(invoice_item.invoice_id)
      expect(json_response["quantity"]).to eq(invoice_item.quantity)
      expect(json_response["unit_price"]).to eq(invoice_item.unit_price)
    end
  end

  describe "GET #show.json with created_at" do
    let(:json_response) { JSON.parse(response.body) }
    let(:invoice_items) { create_list(:invoice_item, 2) }
    let(:invoice_item) { invoice_items.first }

    it "returns the specific invoice_item in JSON format" do
      get :show, created_at: invoice_item.created_at, format: :json

      expect(json_response["id"]).to eq(invoice_item.id)
      expect(json_response["item_id"]).to eq(invoice_item.item_id)
      expect(json_response["invoice_id"]).to eq(invoice_item.invoice_id)
      expect(json_response["quantity"]).to eq(invoice_item.quantity)
      expect(json_response["unit_price"]).to eq(invoice_item.unit_price)
    end
  end

  describe "GET #show.json with updated_at" do
    let(:json_response) { JSON.parse(response.body) }
    let(:invoice_items) { create_list(:invoice_item, 2) }
    let(:invoice_item) { invoice_items.first }

    it "returns the specific invoice_item in JSON format" do
      get :show, updated_at: invoice_item.updated_at, format: :json

      expect(json_response["id"]).to eq(invoice_item.id)
      expect(json_response["item_id"]).to eq(invoice_item.item_id)
      expect(json_response["invoice_id"]).to eq(invoice_item.invoice_id)
      expect(json_response["quantity"]).to eq(invoice_item.quantity)
      expect(json_response["unit_price"]).to eq(invoice_item.unit_price)
    end
  end
end
