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

  describe "GET #index.json with id" do
    let(:json_response) { JSON.parse(response.body)["customers"] }

    it "returns all of the customers in JSON format" do
      customers = create_list(:customer, 2)
      get :index, id: customers.first.id, format: :json

      expect(json_response.count).to eq(1)
      expect(json_response.first["first_name"]).to eq(customers.first.first_name)
      expect(json_response.first["id"]).to eq(customers.first.id)
    end
  end

  describe "GET #index.json with first_name" do
    let(:json_response) { JSON.parse(response.body)["customers"] }

    it "returns all of the customers in JSON format" do
      customers = create_list(:customer, 2, first_name: "Toni")
      get :index, first_name: customers.first.first_name, format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["first_name"]).to eq(customers.first.first_name)
      expect(json_response.first["id"]).to eq(customers.first.id)
      expect(json_response.last["first_name"]).to eq(customers.last.first_name)
      expect(json_response.last["id"]).to eq(customers.last.id)
    end
  end

  describe "GET #index.json with last_name" do
    let(:json_response) { JSON.parse(response.body)["customers"] }

    it "returns all of the customers in JSON format" do
      customers = create_list(:customer, 2, last_name: "Rib")
      get :index, last_name: customers.first.last_name, format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["last_name"]).to eq(customers.first.last_name)
      expect(json_response.first["id"]).to eq(customers.first.id)
      expect(json_response.last["last_name"]).to eq(customers.last.last_name)
      expect(json_response.last["id"]).to eq(customers.last.id)
    end
  end

  describe "GET #index.json with created_at" do
    let(:json_response) { JSON.parse(response.body)["customers"] }

    it "returns all of the customers in JSON format" do
      customers = create_list(:customer, 2, created_at: Date.today)
      get :index, created_at: customers.first.created_at, format: :json

      expect(json_response.count).to eq(2)
      expect(DateTime.parse(json_response.first["created_at"])).to eq(Date.today)
      expect(json_response.first["id"]).to eq(customers.first.id)
      expect(DateTime.parse(json_response.last["created_at"])).to eq(Date.today)
      expect(json_response.last["id"]).to eq(customers.last.id)
    end
  end

  describe "GET #index.json with updated_at" do
    let(:json_response) { JSON.parse(response.body)["customers"] }

    it "returns all of the customers in JSON format" do
      customers = create_list(:customer, 2, updated_at: Date.today)
      get :index, updated_at: customers.first.updated_at, format: :json

      expect(json_response.count).to eq(2)
      expect(DateTime.parse(json_response.first["updated_at"])).to eq(Date.today)
      expect(json_response.first["id"]).to eq(customers.first.id)
      expect(DateTime.parse(json_response.last["updated_at"])).to eq(Date.today)
      expect(json_response.last["id"]).to eq(customers.last.id)
    end
  end

  describe "GET #show.json with id" do
    let(:json_response) { JSON.parse(response.body) }
    let(:customers) { create_list(:customer, 2) }
    let(:customer) { customers.first }

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
    let(:customers) { create_list(:customer, 2) }
    let(:customer) { customers.first }

    it "returns the specific customer in JSON format" do
      get :show, first_name: customer.first_name, format: :json

      expect(json_response["id"]).to eq(customer.id)
      expect(json_response["first_name"]).to eq(customer.first_name)
      expect(json_response["last_name"]).to eq(customer.last_name)
    end

    it "returns the specific customer in JSON format - case insensitive" do
      get :show, first_name: customer.first_name.downcase, format: :json

      expect(json_response["id"]).to eq(customer.id)
      expect(json_response["first_name"]).to eq(customer.first_name)
      expect(json_response["last_name"]).to eq(customer.last_name)
    end
  end

  describe "GET #show.json with last_name" do
    let(:json_response) { JSON.parse(response.body) }
    let(:customers) { create_list(:customer, 2) }
    let(:customer) { customers.first }

    it "returns the specific customer in JSON format" do
      get :show, last_name: customer.last_name, format: :json

      expect(json_response["id"]).to eq(customer.id)
      expect(json_response["first_name"]).to eq(customer.first_name)
      expect(json_response["last_name"]).to eq(customer.last_name)
    end

    it "returns the specific customer in JSON format - case insensitive" do
      get :show, last_name: customer.last_name.downcase, format: :json

      expect(json_response["id"]).to eq(customer.id)
      expect(json_response["first_name"]).to eq(customer.first_name)
      expect(json_response["last_name"]).to eq(customer.last_name)
    end
  end

  describe "GET #show.json with created_at" do
    let(:json_response) { JSON.parse(response.body) }
    let(:customers) { create_list(:customer, 2) }
    let(:customer) { customers.first }

    it "returns the specific customer in JSON format" do
      get :show, created_at: customer.created_at, format: :json

      expect(json_response["id"]).to eq(customer.id)
      expect(json_response["first_name"]).to eq(customer.first_name)
      expect(json_response["last_name"]).to eq(customer.last_name)
    end
  end

  describe "GET #show.json with created_at" do
    let(:json_response) { JSON.parse(response.body) }
    let(:customers) { create_list(:customer, 2) }
    let(:customer) { customers.first }

    it "returns the specific customer in JSON format" do
      get :show, updated_at: customer.updated_at, format: :json

      expect(json_response["id"]).to eq(customer.id)
      expect(json_response["first_name"]).to eq(customer.first_name)
      expect(json_response["last_name"]).to eq(customer.last_name)
    end
  end
end
