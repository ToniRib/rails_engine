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

  describe ".total_revenue_on_date" do
    it "returns total revenue across merchants for a single date" do
      merchant1, merchant2, merchant3 = load_merchants_with_transactions

      revenue = Merchant.total_revenue_on_date(Date.today)

      expect(revenue['total_revenue'].to_f).to eq(1800.00)
    end
  end

  describe "#total_revenue" do
    it "returns total revenue for merchant without date" do
      merchant1, merchant2, merchant3 = load_merchants_with_transactions

      expect(merchant1.total_revenue).to eq(200)
      expect(merchant2.total_revenue).to eq(600)
      expect(merchant3.total_revenue).to eq(1200)
    end

    it "returns total revenue for merchant for a specific date" do
      merchant1, merchant2, merchant3 = load_merchants_with_transactions

      expect(merchant1.total_revenue(Date.today - 1)).to eq(200)
      expect(merchant2.total_revenue(Date.today)).to eq(600)
      expect(merchant3.total_revenue(Date.today)).to eq(1200)
    end
  end

  describe "#favorite_customer" do
    it "returns a merchant's favorite customer" do
      merchant1, merchant2, merchant3 = load_merchants_with_transactions

      expect(merchant1.favorite_customer.id).to eq(Customer.first.id)
      expect(merchant2.favorite_customer.id).to eq(Customer.second.id)
      expect(merchant3.favorite_customer.id).to eq(Customer.third.id)
    end
  end

  def load_merchants_with_transactions
    merchant1, merchant2, merchant3 = create_list(:merchant, 3)
    customer1, customer2, customer3 = create_list(:customer, 3)
    invoice1 = create(:invoice, merchant_id: merchant1.id,
                      created_at: Date.today - 1, customer_id: customer1.id)
    invoice2 = create(:invoice, merchant_id: merchant2.id, customer_id: customer2.id)
    invoice3 = create(:invoice, merchant_id: merchant3.id, customer_id: customer3.id)
    item1 = create(:item, merchant_id: merchant1.id)
    item2 = create(:item, merchant_id: merchant2.id)
    item3 = create(:item, merchant_id: merchant3.id)
    invoice_item1 = create(:invoice_item, invoice_id: invoice1.id,
                           quantity: 1, unit_price: 200,
                           item_id: item1.id)
    invoice_item2 = create(:invoice_item, invoice_id: invoice2.id,
                           quantity: 2, unit_price: 300,
                           item_id: item2.id)
    invoice_item3 = create(:invoice_item, invoice_id: invoice3.id,
                           quantity: 3, unit_price: 400,
                           item_id: item3.id)
    transaction1 = create(:transaction, invoice_id: invoice1.id,
                          result: "success")
    transaction2 = create(:transaction, invoice_id: invoice2.id,
                          result: "success")
    transaction3 = create(:transaction, invoice_id: invoice3.id,
                          result: "success")

    [merchant1, merchant2, merchant3]
  end
end
