require "rails_helper"

RSpec.describe Merchant, type: :model do
  describe ".top_by_revenue" do
    it "returns top x merchants by revenue" do
      merchant1, merchant2, merchant3 = load_merchants_with_transactions

      top_merchants = Merchant.top_by_revenue(2)

      expect(top_merchants.first.id).to eq(merchant3.id)
      expect(top_merchants.first.name).to eq(merchant3.name)
      expect(top_merchants.last.id).to eq(merchant2.id)
      expect(top_merchants.last.name).to eq(merchant2.name)
    end
  end

  describe ".top_by_number_of_items_sold" do
    it "returns top x merchants by number of items sold" do
      merchant1, merchant2, merchant3 = load_merchants_with_transactions

      top_merchants = Merchant.top_by_number_of_items_sold(2)

      expect(top_merchants.first.id).to eq(merchant3.id)
      expect(top_merchants.first.name).to eq(merchant3.name)
      expect(top_merchants.last.id).to eq(merchant2.id)
      expect(top_merchants.last.name).to eq(merchant2.name)
    end
  end

  def load_merchants_with_transactions
    merchant1, merchant2, merchant3 = create_list(:merchant, 3)
    invoice1 = create(:invoice, merchant_id: merchant1.id)
    invoice2 = create(:invoice, merchant_id: merchant2.id)
    invoice3 = create(:invoice, merchant_id: merchant3.id)
    invoice_item1 = create(:invoice_item, invoice_id: invoice1.id, quantity: 1, unit_price: 200)
    invoice_item2 = create(:invoice_item, invoice_id: invoice2.id, quantity: 2, unit_price: 300)
    invoice_item3 = create(:invoice_item, invoice_id: invoice3.id, quantity: 3, unit_price: 400)
    transaction1 = create(:transaction, invoice_id: invoice1.id, result: "success")
    transaction2 = create(:transaction, invoice_id: invoice2.id, result: "success")
    transaction3 = create(:transaction, invoice_id: invoice3.id, result: "success")

    [merchant1, merchant2, merchant3]
  end
end
