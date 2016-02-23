require "rails_helper"

RSpec.describe Api::V1::ItemsController, type: :controller do
  describe "GET #index.json" do
    let(:json_response) { JSON.parse(response.body) }

    it "responds with successful 200 HTTP status code" do
      get :index, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns all of the customers in JSON format" do
      items = create_list(:item, 2)
      get :index, format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["name"]).to eq(items.first.name)
      expect(json_response.first["id"]).to eq(items.first.id)
      expect(json_response.last["name"]).to eq(items.last.name)
      expect(json_response.last["id"]).to eq(items.last.id)
    end
  end

  # Add the rest of the find_all tests here

  describe "GET #show.json with id" do
    let(:json_response) { JSON.parse(response.body) }
    let(:items) { create_list(:item, 2) }
    let(:item) { items.first }

    it "responds with successful 200 HTTP status code" do
      get :show, id: item.id, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns the specific item in JSON format" do
      get :show, id: item.id, format: :json

      expect(json_response["id"]).to eq(item.id)
      expect(json_response["description"]).to eq(item.description)
      expect(json_response["unit_price"]).to eq(item.unit_price)
      expect(json_response["merchant_id"]).to eq(item.merchant_id)
    end
  end

  describe "GET #show.json with name" do
    let(:json_response) { JSON.parse(response.body) }
    let(:items) { create_list(:item, 2) }
    let(:item) { items.first }

    it "returns the specific item in JSON format" do
      get :show, name: item.name, format: :json

      expect(json_response["id"]).to eq(item.id)
      expect(json_response["description"]).to eq(item.description)
      expect(json_response["unit_price"]).to eq(item.unit_price)
      expect(json_response["merchant_id"]).to eq(item.merchant_id)
    end

    it "returns the specific item in JSON format - case insensitive" do
      get :show, name: item.name.downcase, format: :json

      expect(json_response["id"]).to eq(item.id)
      expect(json_response["description"]).to eq(item.description)
      expect(json_response["unit_price"]).to eq(item.unit_price)
      expect(json_response["merchant_id"]).to eq(item.merchant_id)
    end
  end

  describe "GET #show.json with description" do
    let(:json_response) { JSON.parse(response.body) }
    let(:items) { create_list(:item, 2) }
    let(:item) { items.first }

    it "returns the specific item in JSON format" do
      get :show, description: item.description, format: :json

      expect(json_response["id"]).to eq(item.id)
      expect(json_response["description"]).to eq(item.description)
      expect(json_response["unit_price"]).to eq(item.unit_price)
      expect(json_response["merchant_id"]).to eq(item.merchant_id)
    end

    it "returns the specific item in JSON format - case insensitive" do
      get :show, description: item.description.upcase, format: :json

      expect(json_response["id"]).to eq(item.id)
      expect(json_response["description"]).to eq(item.description)
      expect(json_response["unit_price"]).to eq(item.unit_price)
      expect(json_response["merchant_id"]).to eq(item.merchant_id)
    end
  end

  describe "GET #show.json with unit_price" do
    let(:json_response) { JSON.parse(response.body) }
    let(:items) { create_list(:item, 2) }
    let(:item) { items.first }

    it "returns the specific item in JSON format" do
      get :show, unit_price: item.unit_price, format: :json

      expect(json_response["id"]).to eq(item.id)
      expect(json_response["description"]).to eq(item.description)
      expect(json_response["unit_price"]).to eq(item.unit_price)
      expect(json_response["merchant_id"]).to eq(item.merchant_id)
    end
  end

  describe "GET #show.json with merchant_id" do
    let(:json_response) { JSON.parse(response.body) }
    let(:items) { create_list(:item, 2) }
    let(:item) { items.first }

    it "returns the specific item in JSON format" do
      get :show, merchant_id: item.merchant_id, format: :json

      expect(json_response["id"]).to eq(item.id)
      expect(json_response["description"]).to eq(item.description)
      expect(json_response["unit_price"]).to eq(item.unit_price)
      expect(json_response["merchant_id"]).to eq(item.merchant_id)
    end
  end

  describe "GET #show.json with created_at" do
    let(:json_response) { JSON.parse(response.body) }
    let(:items) { create_list(:item, 2) }
    let(:item) { items.first }

    it "returns the specific item in JSON format" do
      get :show, created_at: item.created_at.to_json, format: :json

      expect(json_response["id"]).to eq(item.id)
      expect(json_response["description"]).to eq(item.description)
      expect(json_response["unit_price"]).to eq(item.unit_price)
      expect(json_response["merchant_id"]).to eq(item.merchant_id)
    end
  end

  describe "GET #show.json with updated_at" do
    let(:json_response) { JSON.parse(response.body) }
    let(:items) { create_list(:item, 2) }
    let(:item) { items.first }

    it "returns the specific item in JSON format" do
      get :show, updated_at: item.updated_at.to_json, format: :json

      expect(json_response["id"]).to eq(item.id)
      expect(json_response["description"]).to eq(item.description)
      expect(json_response["unit_price"]).to eq(item.unit_price)
      expect(json_response["merchant_id"]).to eq(item.merchant_id)
    end
  end
end
