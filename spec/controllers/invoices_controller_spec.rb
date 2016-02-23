require "rails_helper"

RSpec.describe Api::V1::InvoicesController, type: :controller do
  describe "GET #index.json" do
    let(:json_response) { JSON.parse(response.body) }

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

  describe "GET #index.json with id" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all of the customers in JSON format" do
      invoices = create_list(:invoice, 2)
      get :index, id: invoices.first.id, format: :json

      expect(json_response.count).to eq(1)
      expect(json_response.first["id"]).to eq(invoices.first.id)
      expect(json_response.first["customer_id"]).to eq(invoices.first.customer_id)
    end
  end

  describe "GET #index.json with customer_id" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all of the customers in JSON format" do
      customer = create(:customer)
      invoices = create_list(:invoice, 2, customer_id: customer.id)
      get :index, customer_id: customer.id, format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["id"]).to eq(invoices.first.id)
      expect(json_response.first["customer_id"]).to eq(invoices.first.customer_id)
      expect(json_response.last["id"]).to eq(invoices.last.id)
      expect(json_response.last["customer_id"]).to eq(invoices.last.customer_id)
    end
  end

  describe "GET #index.json with merchant_id" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all of the customers in JSON format" do
      merchant = create(:merchant)
      invoices = create_list(:invoice, 2, merchant_id: merchant.id)
      get :index, merchant_id: merchant.id, format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["id"]).to eq(invoices.first.id)
      expect(json_response.first["merchant_id"]).to eq(invoices.first.merchant_id)
      expect(json_response.last["id"]).to eq(invoices.last.id)
      expect(json_response.last["merchant_id"]).to eq(invoices.last.merchant_id)
    end
  end

  describe "GET #index.json with status" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all of the customers in JSON format" do
      invoices = create_list(:invoice, 2, status: "shipped")
      get :index, status: "shipped", format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["id"]).to eq(invoices.first.id)
      expect(json_response.first["status"]).to eq("shipped")
      expect(json_response.last["id"]).to eq(invoices.last.id)
      expect(json_response.last["status"]).to eq("shipped")
    end
  end

  describe "GET #index.json with created_at" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all of the customers in JSON format" do
      invoices = create_list(:invoice, 2, created_at: Date.today)
      get :index, created_at: Date.today.to_json, format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["id"]).to eq(invoices.first.id)
      expect(json_response.last["id"]).to eq(invoices.last.id)
    end
  end

  describe "GET #index.json with updated_at" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all of the customers in JSON format" do
      invoices = create_list(:invoice, 2, updated_at: Date.today)
      get :index, updated_at: Date.today.to_json, format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["id"]).to eq(invoices.first.id)
      expect(json_response.last["id"]).to eq(invoices.last.id)
    end
  end

  describe "GET #show.json with id" do
    let(:json_response) { JSON.parse(response.body) }
    let(:invoices) { create_list(:invoice, 2) }
    let(:invoice) { invoices.first }

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

  describe "GET #show.json with customer_id" do
    let(:json_response) { JSON.parse(response.body) }
    let(:invoices) { create_list(:invoice, 2) }
    let(:invoice) { invoices.first }

    it "returns the specific invoice in JSON format" do
      get :show, customer_id: invoice.customer_id, format: :json

      expect(json_response["id"]).to eq(invoice.id)
      expect(json_response["customer_id"]).to eq(invoice.customer_id)
      expect(json_response["merchant_id"]).to eq(invoice.merchant_id)
      expect(json_response["status"]).to eq(invoice.status)
    end
  end

  describe "GET #show.json with merchant_id" do
    let(:json_response) { JSON.parse(response.body) }
    let(:invoices) { create_list(:invoice, 2) }
    let(:invoice) { invoices.first }

    it "returns the specific invoice in JSON format" do
      get :show, merchant_id: invoice.merchant_id, format: :json

      expect(json_response["id"]).to eq(invoice.id)
      expect(json_response["customer_id"]).to eq(invoice.customer_id)
      expect(json_response["merchant_id"]).to eq(invoice.merchant_id)
      expect(json_response["status"]).to eq(invoice.status)
    end
  end

  describe "GET #show.json with status" do
    let(:json_response) { JSON.parse(response.body) }
    let(:invoices) { create_list(:invoice, 2) }
    let(:invoice) { invoices.first }

    it "returns the specific invoice in JSON format" do
      get :show, status: invoice.status, format: :json

      expect(json_response["id"]).to eq(invoice.id)
      expect(json_response["customer_id"]).to eq(invoice.customer_id)
      expect(json_response["merchant_id"]).to eq(invoice.merchant_id)
      expect(json_response["status"]).to eq(invoice.status)
    end
  end

  describe "GET #show.json with created_at" do
    let(:json_response) { JSON.parse(response.body) }
    let(:invoices) { create_list(:invoice, 2) }
    let(:invoice) { invoices.first }

    it "returns the specific invoice in JSON format" do
      get :show, created_at: invoice.created_at.to_json, format: :json

      expect(json_response["id"]).to eq(invoice.id)
      expect(json_response["customer_id"]).to eq(invoice.customer_id)
      expect(json_response["merchant_id"]).to eq(invoice.merchant_id)
      expect(json_response["status"]).to eq(invoice.status)
    end
  end

  describe "GET #show.json with updated_at" do
    let(:json_response) { JSON.parse(response.body) }
    let(:invoices) { create_list(:invoice, 2) }
    let(:invoice) { invoices.first }

    it "returns the specific invoice in JSON format" do
      get :show, updated_at: invoice.updated_at.to_json, format: :json

      expect(json_response["id"]).to eq(invoice.id)
      expect(json_response["customer_id"]).to eq(invoice.customer_id)
      expect(json_response["merchant_id"]).to eq(invoice.merchant_id)
      expect(json_response["status"]).to eq(invoice.status)
    end
  end
end
