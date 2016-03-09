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

  describe "#customers_with_pending_invoices" do
    it "returns a list of customers with failed invoices" do
      merchant1, merchant2, merchant3 = load_merchants_with_transactions
      customer = merchant1.customers.first
      customer.transactions.first.update_attribute(:result, "failed")

      result = merchant1.customers_with_pending_invoices

      expect(result.first).to eq(customer)
    end
  end

  it_behaves_like "a model with successful transactions"
end
