require "rails_helper"

RSpec.describe Customer, type: :model do
  describe "#favorite_merchant" do
    it "returns a specific customer's favorite merchant" do
      merchant1, merchant2, merchant3 = load_merchants_with_transactions
      customer1 = merchant1.customers.first

      expect(customer1.favorite_merchant.id).to eq(merchant1.id)
    end
  end
end
