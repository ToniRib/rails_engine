require "rails_helper"

RSpec.describe MerchantFinder, type: :model do
  describe "#find_single" do
    it "finds single merchant by id" do
      load_merchants
      merchant = MerchantFinder.find_single(id: 1)

      expect(merchant.id).to eq(1)
      expect(merchant.name).to eq("Toni")
    end

    it "finds single merchant by name" do
      load_merchants
      merchant = MerchantFinder.find_single(name: "Toni")
      expect(merchant.id).to eq(1)
      expect(merchant.name).to eq("Toni")

      merchant = MerchantFinder.find_single(name: "Dan")
      expect(merchant.id).to eq(3)
      expect(merchant.name).to eq("Dan")
    end

    it "finds single merchant by created_at JSON string" do
      load_merchants
      date = (Date.today - 2).to_json
      merchant = MerchantFinder.find_single(created_at: date)
      expect(merchant.id).to eq(1)
      expect(merchant.created_at).to eq(Date.today - 2)
      expect(merchant.name).to eq("Toni")

      date = (Date.today - 1).to_json
      merchant = MerchantFinder.find_single(created_at: date)
      expect(merchant.id).to eq(2)
      expect(merchant.created_at).to eq(Date.today - 1)
      expect(merchant.name).to eq("Toni")
    end

    it "finds single merchant by updated_at JSON string" do
      load_merchants
      date = (Date.today - 2).to_json
      merchant = MerchantFinder.find_single(updated_at: date)
      expect(merchant.id).to eq(1)
      expect(merchant.updated_at).to eq(Date.today - 2)
      expect(merchant.name).to eq("Toni")

      date = (Date.today - 1).to_json
      merchant = MerchantFinder.find_single(updated_at: date)
      expect(merchant.id).to eq(2)
      expect(merchant.updated_at).to eq(Date.today - 1)
      expect(merchant.name).to eq("Toni")
    end
  end

  describe "#find_multiple" do
    it "finds one merchant by id" do
      load_merchants
      merchants = MerchantFinder.find_multiple(id: 1)

      expect(merchants.first.id).to eq(1)
      expect(merchants.first.name).to eq("Toni")
    end

    it "finds multiple merchants by name" do
      load_merchants
      merchants = MerchantFinder.find_multiple(name: "Toni")

      expect(merchants.first.id).to eq(1)
      expect(merchants.first.name).to eq("Toni")
      expect(merchants.last.id).to eq(2)
      expect(merchants.last.name).to eq("Toni")
    end

    it "finds multiple merchants by created_at JSON string" do
      load_merchants
      date = (Date.today - 2).to_json
      merchants = MerchantFinder.find_multiple(created_at: date)

      expect(merchants.first.id).to eq(1)
      expect(merchants.first.name).to eq("Toni")
      expect(merchants.last.id).to eq(3)
      expect(merchants.last.name).to eq("Dan")
    end

    it "finds multiple merchants by updated_at JSON string" do
      load_merchants
      date = (Date.today - 2).to_json
      merchants = MerchantFinder.find_multiple(updated_at: date)

      expect(merchants.first.id).to eq(1)
      expect(merchants.first.name).to eq("Toni")
      expect(merchants.last.id).to eq(3)
      expect(merchants.last.name).to eq("Dan")
    end
  end

  def load_merchants
    create(:merchant, id: 1,
                      name: "Toni",
                      created_at: Date.today - 2,
                      updated_at: Date.today - 2)
    create(:merchant, id: 2,
                      name: "Toni",
                      created_at: Date.today - 1,
                      updated_at: Date.today - 1)
    create(:merchant, id: 3,
                      name: "Dan",
                      created_at: Date.today - 2,
                      updated_at: Date.today - 2)
  end
end
