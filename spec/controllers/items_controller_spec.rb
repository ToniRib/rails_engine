require "rails_helper"

RSpec.describe Api::V1::ItemsController, type: :controller do
  describe "GET #index.json" do
    let(:json_response) { JSON.parse(response.body) }

    it "responds with successful 200 HTTP status code" do
      get :index, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns all of the items in JSON format" do
      items = create_list(:item, 2)
      get :index, format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["name"]).to eq(items.first.name)
      expect(json_response.first["id"]).to eq(items.first.id)
      expect(json_response.last["name"]).to eq(items.last.name)
      expect(json_response.last["id"]).to eq(items.last.id)
    end
  end

  describe "GET #index.json with id" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all of the items in JSON format" do
      items = create_list(:item, 2)
      get :index, id: items.first.id, format: :json

      expect(json_response.count).to eq(1)
      expect(json_response.first["name"]).to eq(items.first.name)
      expect(json_response.first["id"]).to eq(items.first.id)
    end
  end

  describe "GET #index.json with name" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all of the items in JSON format" do
      items = create_list(:item, 2, name: "Paperclips")
      get :index, name: "Paperclips", format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["name"]).to eq("Paperclips")
      expect(json_response.first["id"]).to eq(items.first.id)
      expect(json_response.last["name"]).to eq("Paperclips")
      expect(json_response.last["id"]).to eq(items.last.id)
    end

    it "returns all of the items in JSON format - case insensitive" do
      items = create_list(:item, 2, name: "Paperclips")
      get :index, name: "Paperclips".upcase, format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["name"]).to eq("Paperclips")
      expect(json_response.first["id"]).to eq(items.first.id)
      expect(json_response.last["name"]).to eq("Paperclips")
      expect(json_response.last["id"]).to eq(items.last.id)
    end
  end

  describe "GET #index.json with description" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all of the items in JSON format" do
      items = create_list(:item, 2, description: "Paperclips")
      get :index, description: "Paperclips", format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["description"]).to eq("Paperclips")
      expect(json_response.first["id"]).to eq(items.first.id)
      expect(json_response.last["description"]).to eq("Paperclips")
      expect(json_response.last["id"]).to eq(items.last.id)
    end

    it "returns all of the items in JSON format - case insensitive" do
      items = create_list(:item, 2, description: "Paperclips")
      get :index, description: "Paperclips".upcase, format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["description"]).to eq("Paperclips")
      expect(json_response.first["id"]).to eq(items.first.id)
      expect(json_response.last["description"]).to eq("Paperclips")
      expect(json_response.last["id"]).to eq(items.last.id)
    end
  end

  describe "GET #index.json with unit_price" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all of the items in JSON format" do
      items = create_list(:item, 2, unit_price: "123.45")
      get :index, unit_price: "123.45", format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["unit_price"]).to eq("123.45")
      expect(json_response.first["id"]).to eq(items.first.id)
      expect(json_response.last["unit_price"]).to eq("123.45")
      expect(json_response.last["id"]).to eq(items.last.id)
    end
  end

  describe "GET #index.json with merchant_id" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all of the items in JSON format" do
      merchant = create(:merchant)
      items = create_list(:item, 2, merchant_id: merchant.id)
      get :index, merchant_id: merchant.id, format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["merchant_id"]).to eq(merchant.id)
      expect(json_response.first["id"]).to eq(items.first.id)
      expect(json_response.last["merchant_id"]).to eq(merchant.id)
      expect(json_response.last["id"]).to eq(items.last.id)
    end
  end

  describe "GET #index.json with created_at" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all of the items in JSON format" do
      items = create_list(:item, 2, created_at: Date.today)
      get :index, created_at: Date.today, format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["id"]).to eq(items.first.id)
      expect(json_response.last["id"]).to eq(items.last.id)
    end
  end

  describe "GET #index.json with updated_at" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns all of the items in JSON format" do
      items = create_list(:item, 2, updated_at: Date.today)
      get :index, updated_at: Date.today, format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["id"]).to eq(items.first.id)
      expect(json_response.last["id"]).to eq(items.last.id)
    end
  end

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
      expect(json_response["unit_price"]).to eq(item.unit_price.to_s)
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
      expect(json_response["unit_price"]).to eq(item.unit_price.to_s)
      expect(json_response["merchant_id"]).to eq(item.merchant_id)
    end

    it "returns the specific item in JSON format - case insensitive" do
      get :show, name: item.name.downcase, format: :json

      expect(json_response["id"]).to eq(item.id)
      expect(json_response["description"]).to eq(item.description)
      expect(json_response["unit_price"]).to eq(item.unit_price.to_s)
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
      expect(json_response["unit_price"]).to eq(item.unit_price.to_s)
      expect(json_response["merchant_id"]).to eq(item.merchant_id)
    end

    it "returns the specific item in JSON format - case insensitive" do
      get :show, description: item.description.upcase, format: :json

      expect(json_response["id"]).to eq(item.id)
      expect(json_response["description"]).to eq(item.description)
      expect(json_response["unit_price"]).to eq(item.unit_price.to_s)
      expect(json_response["merchant_id"]).to eq(item.merchant_id)
    end
  end

  describe "GET #show.json with unit_price" do
    let(:json_response) { JSON.parse(response.body) }
    let(:items) { create_list(:item, 2) }
    let(:item) { items.first }

    it "returns the specific item in JSON format" do
      get :show, unit_price: item.unit_price.to_s, format: :json

      expect(json_response["id"]).to eq(item.id)
      expect(json_response["description"]).to eq(item.description)
      expect(json_response["unit_price"]).to eq(item.unit_price.to_s)
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
      expect(json_response["unit_price"]).to eq(item.unit_price.to_s)
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
      expect(json_response["unit_price"]).to eq(item.unit_price.to_s)
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
      expect(json_response["unit_price"]).to eq(item.unit_price.to_s)
      expect(json_response["merchant_id"]).to eq(item.merchant_id)
    end
  end
end
