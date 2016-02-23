require "rails_helper"

RSpec.describe Api::V1::TransactionsController, type: :controller do
  describe "GET #index.json" do
    let(:json_response) { JSON.parse(response.body) }

    it "responds with successful 200 HTTP status code" do
      get :index, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns all of the customers in JSON format" do
      transactions = create_list(:transaction, 2)
      get :index, format: :json

      expect(json_response.count).to eq(2)
      expect(json_response.first["id"]).to eq(transactions.first.id)
      expect(json_response.first["invoice_id"]).to eq(transactions.first.invoice_id)
      expect(json_response.last["id"]).to eq(transactions.last.id)
      expect(json_response.last["invoice_id"]).to eq(transactions.last.invoice_id)
    end
  end

  # Add the rest of the find_all tests here

  describe "GET #show.json with id" do
    let(:json_response) { JSON.parse(response.body) }
    let(:transactions) { create_list(:transaction, 2) }
    let(:transaction) { transactions.first }

    it "responds with successful 200 HTTP status code" do
      get :show, id: transaction.id, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns the specific transaction in JSON format" do
      get :show, id: transaction.id, format: :json

      expect(json_response["id"]).to eq(transaction.id)
      expect(json_response["invoice_id"]).to eq(transaction.invoice_id)
      expect(json_response["credit_card_number"]).to eq(transaction.credit_card_number)
      expect(json_response["result"]).to eq(transaction.result)
    end
  end

  describe "GET #show.json with invoice_id" do
    let(:json_response) { JSON.parse(response.body) }
    let(:transactions) { create_list(:transaction, 2) }
    let(:transaction) { transactions.first }


    it "returns the specific transaction in JSON format" do
      get :show, invoice_id: transaction.invoice_id, format: :json

      expect(json_response["id"]).to eq(transaction.id)
      expect(json_response["invoice_id"]).to eq(transaction.invoice_id)
      expect(json_response["credit_card_number"]).to eq(transaction.credit_card_number)
      expect(json_response["result"]).to eq(transaction.result)
    end
  end

  describe "GET #show.json with credit_card_number" do
    let(:json_response) { JSON.parse(response.body) }
    let(:transactions) { create_list(:transaction, 2) }
    let(:transaction) { transactions.first }


    it "returns the specific transaction in JSON format" do
      get :show, credit_card_number: transaction.credit_card_number, format: :json

      expect(json_response["id"]).to eq(transaction.id)
      expect(json_response["invoice_id"]).to eq(transaction.invoice_id)
      expect(json_response["credit_card_number"]).to eq(transaction.credit_card_number)
      expect(json_response["result"]).to eq(transaction.result)
    end
  end

  describe "GET #show.json with result" do
    let(:json_response) { JSON.parse(response.body) }
    let(:transactions) { create_list(:transaction, 2) }
    let(:transaction) { transactions.first }


    it "returns the specific transaction in JSON format" do
      get :show, result: transaction.result, format: :json

      expect(json_response["id"]).to eq(transaction.id)
      expect(json_response["invoice_id"]).to eq(transaction.invoice_id)
      expect(json_response["credit_card_number"]).to eq(transaction.credit_card_number)
      expect(json_response["result"]).to eq(transaction.result)
    end
  end

  describe "GET #show.json with created_at" do
    let(:json_response) { JSON.parse(response.body) }
    let(:transactions) { create_list(:transaction, 2) }
    let(:transaction) { transactions.first }


    it "returns the specific transaction in JSON format" do
      get :show, created_at: transaction.created_at.to_json, format: :json

      expect(json_response["id"]).to eq(transaction.id)
      expect(json_response["invoice_id"]).to eq(transaction.invoice_id)
      expect(json_response["credit_card_number"]).to eq(transaction.credit_card_number)
      expect(json_response["result"]).to eq(transaction.result)
    end
  end

  describe "GET #show.json with updated_at" do
    let(:json_response) { JSON.parse(response.body) }
    let(:transactions) { create_list(:transaction, 2) }
    let(:transaction) { transactions.first }


    it "returns the specific transaction in JSON format" do
      get :show, updated_at: transaction.updated_at.to_json, format: :json

      expect(json_response["id"]).to eq(transaction.id)
      expect(json_response["invoice_id"]).to eq(transaction.invoice_id)
      expect(json_response["credit_card_number"]).to eq(transaction.credit_card_number)
      expect(json_response["result"]).to eq(transaction.result)
    end
  end
end
