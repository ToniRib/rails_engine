require "rails_helper"

RSpec.describe Api::V1::CustomersController, type: :controller do
  describe "GET #index.json" do
    let(:json_response) { JSON.parse(response.body)["customers"] }

    it "responds with successful 200 HTTP status code" do
      get :index, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns all of the customers in JSON format" do
      customers = create_list(:customer, 2)
      get :index, format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["first_name"]).to eq(customers.first.first_name)
      expect(json_response.first["id"]).to eq(customers.first.id)
      expect(json_response.last["first_name"]).to eq(customers.last.first_name)
      expect(json_response.last["id"]).to eq(customers.last.id)
    end
  end

  describe "GET #show.json with id" do
    let(:json_response) { JSON.parse(response.body) }
    let(:customer) { create(:customer) }

    it "responds with successful 200 HTTP status code" do
      get :show, id: customer.id, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns the specific customer in JSON format" do
      get :show, id: customer.id, format: :json

      expect(json_response["id"]).to eq(customer.id)
      expect(json_response["first_name"]).to eq(customer.first_name)
      expect(json_response["last_name"]).to eq(customer.last_name)
    end
  end

  describe "GET #show.json with first_name" do
    let(:json_response) { JSON.parse(response.body) }
    let(:customer) { create(:customer) }

    it "responds with successful 200 HTTP status code" do
      get :show, first_name: customer.first_name, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns the specific customer in JSON format" do
      get :show, first_name: customer.first_name, format: :json

      expect(json_response["first_name"]).to eq(customer.first_name)
      expect(json_response["first_name"]).to eq(customer.first_name)
      expect(json_response["last_name"]).to eq(customer.last_name)
    end

    it "returns the specific customer in JSON format - case insensitive" do
      get :show, first_name: customer.first_name.downcase, format: :json

      expect(json_response["first_name"]).to eq(customer.first_name)
      expect(json_response["first_name"]).to eq(customer.first_name)
      expect(json_response["last_name"]).to eq(customer.last_name)
    end
  end

  describe "GET #show.json with last_name" do
    let(:json_response) { JSON.parse(response.body) }
    let(:customer) { create(:customer) }

    it "responds with successful 200 HTTP status code" do
      get :show, last_name: customer.last_name, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns the specific customer in JSON format" do
      get :show, last_name: customer.last_name, format: :json

      expect(json_response["last_name"]).to eq(customer.last_name)
      expect(json_response["first_name"]).to eq(customer.first_name)
      expect(json_response["last_name"]).to eq(customer.last_name)
    end

    it "returns the specific customer in JSON format - case insensitive" do
      get :show, last_name: customer.last_name.downcase, format: :json

      expect(json_response["last_name"]).to eq(customer.last_name)
      expect(json_response["first_name"]).to eq(customer.first_name)
      expect(json_response["last_name"]).to eq(customer.last_name)
    end
  end
end
