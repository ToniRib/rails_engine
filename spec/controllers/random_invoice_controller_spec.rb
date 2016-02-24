require "rails_helper"

RSpec.describe Api::V1::RandomInvoiceController, type: :controller do
  describe "GET #show.json" do
    let(:json_response) { JSON.parse(response.body) }

    it "responds with successful 200 HTTP status code" do
      get :show, format: :json

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns a random invoice with an id" do
      create_list(:invoice, 2)
      get :show, format: :json

      expect(json_response.key?("id")).to be true
    end
  end
end
