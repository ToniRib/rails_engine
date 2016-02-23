require "rails_helper"

RSpec.describe Api::V1::MerchantsController, type: :controller do
  describe "GET #index.json" do
    let(:json_response) { JSON.parse(response.body)["merchants"] }

    it "responds with successful 200 HTTP status code" do
      get :index, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns all of the merchants in JSON format" do
      merchants = create_list(:merchant, 2)
      get :index, format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["name"]).to eq(merchants.first.name)
      expect(json_response.first["id"]).to eq(merchants.first.id)
      expect(json_response.last["name"]).to eq(merchants.last.name)
      expect(json_response.last["id"]).to eq(merchants.last.id)
    end
  end

  describe "GET #index.json with id" do
    let(:json_response) { JSON.parse(response.body)["merchants"] }
    let(:merchants) { create_list(:merchant, 2) }
    let(:merchant) { merchants.first }

    it "responds with successful 200 HTTP status code" do
      get :index, id: merchant.id, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns the specific merchant in JSON format" do
      get :index, id: merchant.id, format: :json

      expect(json_response.first["id"]).to eq(merchant.id)
      expect(json_response.first["name"]).to eq(merchant.name)
    end
  end

  describe "GET #index.json with name" do
    let(:json_response) { JSON.parse(response.body)["merchants"] }
    let(:merchants) { create_list(:merchant, 2, name: "Toni") }

    it "returns the specific merchant in JSON format" do
      get :index, name: merchants.first.name, format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["id"]).to eq(merchants.first.id)
      expect(json_response.first["name"]).to eq(merchants.first.name)
      expect(json_response.last["id"]).to eq(merchants.last.id)
      expect(json_response.last["name"]).to eq(merchants.last.name)
    end

    it "returns the specific merchant in JSON format - case insensitive" do
      get :index, name: merchants.first.name.downcase, format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["id"]).to eq(merchants.first.id)
      expect(json_response.first["name"]).to eq(merchants.first.name)
      expect(json_response.last["id"]).to eq(merchants.last.id)
      expect(json_response.last["name"]).to eq(merchants.last.name)
    end
  end

  describe "GET #index.json with created_at" do
    let(:json_response) { JSON.parse(response.body)["merchants"] }
    let(:merchants) { create_list(:merchant, 2, created_at: Date.today) }
    let(:merchant) { merchants.first }

    it "returns the specific merchant in JSON format" do
      get :index, created_at: merchants.first.created_at, format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["id"]).to eq(merchants.first.id)
      expect(json_response.first["name"]).to eq(merchants.first.name)
      expect(json_response.last["id"]).to eq(merchants.last.id)
      expect(json_response.last["name"]).to eq(merchants.last.name)
    end
  end

  describe "GET #index.json with updated_at" do
    let(:json_response) { JSON.parse(response.body)["merchants"] }
    let(:merchants) { create_list(:merchant, 2, updated_at: Date.today) }
    let(:merchant) { merchants.first }

    it "returns the specific merchant in JSON format" do
      get :index, updated_at: merchants.first.updated_at, format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["id"]).to eq(merchants.first.id)
      expect(json_response.first["name"]).to eq(merchants.first.name)
      expect(json_response.last["id"]).to eq(merchants.last.id)
      expect(json_response.last["name"]).to eq(merchants.last.name)
    end
  end

  describe "GET #show.json with id" do
    let(:json_response) { JSON.parse(response.body) }
    let(:merchants) { create_list(:merchant, 2) }
    let(:merchant) { merchants.first }

    it "responds with successful 200 HTTP status code" do
      get :show, id: merchant.id, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns the specific merchant in JSON format" do
      get :show, id: merchant.id, format: :json

      expect(json_response["id"]).to eq(merchant.id)
      expect(json_response["name"]).to eq(merchant.name)
    end
  end

  describe "GET #show.json with name" do
    let(:json_response) { JSON.parse(response.body) }
    let(:merchants) { create_list(:merchant, 2) }
    let(:merchant) { merchants.first }

    it "returns the specific merchant in JSON format" do
      get :show, name: merchant.name, format: :json

      expect(json_response["id"]).to eq(merchant.id)
      expect(json_response["name"]).to eq(merchant.name)
    end

    it "returns the specific merchant in JSON format - case insensitive" do
      get :show, name: merchant.name.downcase, format: :json

      expect(json_response["id"]).to eq(merchant.id)
      expect(json_response["name"]).to eq(merchant.name)
    end
  end

  describe "GET #show.json with created_at" do
    let(:json_response) { JSON.parse(response.body) }
    let(:merchants) { create_list(:merchant, 2) }
    let(:merchant) { merchants.first }

    it "returns the specific merchant in JSON format" do
      get :show, created_at: merchant.created_at, format: :json

      expect(json_response["id"]).to eq(merchant.id)
      expect(json_response["name"]).to eq(merchant.name)
    end
  end

  describe "GET #show.json with updated_at" do
    let(:json_response) { JSON.parse(response.body) }
    let(:merchants) { create_list(:merchant, 2) }
    let(:merchant) { merchants.first }

    it "returns the specific merchant in JSON format" do
      get :show, updated_at: merchant.updated_at, format: :json

      expect(json_response["id"]).to eq(merchant.id)
      expect(json_response["name"]).to eq(merchant.name)
    end
  end
end
