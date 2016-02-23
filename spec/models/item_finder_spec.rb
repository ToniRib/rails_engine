require "rails_helper"

RSpec.describe ItemFinder, type: :model do
  describe "#find_single" do
    it "finds single item by id" do
      load_items
      item = ItemFinder.find_single(id: 1)

      expect(item.id).to eq(1)
      expect(item.name).to eq("Toni")
    end

    it "finds single item by name" do
      load_items
      item = ItemFinder.find_single(name: "Toni")
      expect(item.id).to eq(1)
      expect(item.name).to eq("Toni")

      item = ItemFinder.find_single(name: "Dan")
      expect(item.id).to eq(3)
      expect(item.name).to eq("Dan")
    end

    it "finds single item by description" do
      load_items
      item = ItemFinder.find_single(description: "Rib")
      expect(item.id).to eq(1)
      expect(item.name).to eq("Toni")
      expect(item.description).to eq("Rib")

      item = ItemFinder.find_single(description: "Aubrecht")
      expect(item.id).to eq(2)
      expect(item.name).to eq("Toni")
      expect(item.description).to eq("Aubrecht")
    end

    it "finds single item by unit price" do
      load_items
      item = ItemFinder.find_single(unit_price: "123.45")
      expect(item.id).to eq(1)
      expect(item.name).to eq("Toni")
      expect(item.unit_price).to eq("123.45")

      item = ItemFinder.find_single(unit_price: "234.56")
      expect(item.id).to eq(2)
      expect(item.name).to eq("Toni")
      expect(item.unit_price).to eq("234.56")
    end

    it "finds single item by merchant id" do
      load_items
      item = ItemFinder.find_single(merchant_id: 1)
      expect(item.id).to eq(1)
      expect(item.name).to eq("Toni")
      expect(item.merchant_id).to eq(1)

      item = ItemFinder.find_single(merchant_id: 2)
      expect(item.id).to eq(2)
      expect(item.name).to eq("Toni")
      expect(item.merchant_id).to eq(2)
    end

    it "finds single item by created_at JSON string" do
      load_items
      date = (Date.today - 2).to_json
      item = ItemFinder.find_single(created_at: date)
      expect(item.id).to eq(1)
      expect(item.created_at).to eq(Date.today - 2)
      expect(item.name).to eq("Toni")

      date = (Date.today - 1).to_json
      item = ItemFinder.find_single(created_at: date)
      expect(item.id).to eq(2)
      expect(item.created_at).to eq(Date.today - 1)
      expect(item.name).to eq("Toni")
    end

    it "finds single item by updated_at JSON string" do
      load_items
      date = (Date.today - 2).to_json
      item = ItemFinder.find_single(updated_at: date)
      expect(item.id).to eq(1)
      expect(item.updated_at).to eq(Date.today - 2)
      expect(item.name).to eq("Toni")

      date = (Date.today - 1).to_json
      item = ItemFinder.find_single(updated_at: date)
      expect(item.id).to eq(2)
      expect(item.updated_at).to eq(Date.today - 1)
      expect(item.name).to eq("Toni")
    end
  end

  describe "#find_multiple" do
    it "finds one item by id" do
      load_items
      items = ItemFinder.find_multiple(id: 1)

      expect(items.first.id).to eq(1)
      expect(items.first.name).to eq("Toni")
    end

    it "finds multiple items by name" do
      load_items
      items = ItemFinder.find_multiple(name: "Toni")

      expect(items.first.id).to eq(1)
      expect(items.first.name).to eq("Toni")
      expect(items.first.description).to eq("Rib")
      expect(items.last.id).to eq(2)
      expect(items.last.name).to eq("Toni")
      expect(items.last.description).to eq("Aubrecht")
    end

    it "finds multiple items by description" do
      load_items
      items = ItemFinder.find_multiple(description: "Rib")

      expect(items.first.id).to eq(1)
      expect(items.first.name).to eq("Toni")
      expect(items.first.description).to eq("Rib")
      expect(items.last.id).to eq(3)
      expect(items.last.name).to eq("Dan")
      expect(items.last.description).to eq("Rib")
    end

    it "finds multiple items by unit price" do
      load_items
      items = ItemFinder.find_multiple(unit_price: "123.45")

      expect(items.first.id).to eq(1)
      expect(items.first.name).to eq("Toni")
      expect(items.first.description).to eq("Rib")
      expect(items.last.id).to eq(3)
      expect(items.last.name).to eq("Dan")
      expect(items.last.description).to eq("Rib")
    end

    it "finds multiple items by merchant id" do
      load_items
      items = ItemFinder.find_multiple(merchant_id: 2)

      expect(items.first.id).to eq(2)
      expect(items.first.name).to eq("Toni")
      expect(items.first.description).to eq("Aubrecht")
      expect(items.last.id).to eq(3)
      expect(items.last.name).to eq("Dan")
      expect(items.last.description).to eq("Rib")
    end

    it "finds multiple items by created_at JSON string" do
      load_items
      date = (Date.today - 2).to_json
      items = ItemFinder.find_multiple(created_at: date)

      expect(items.first.id).to eq(1)
      expect(items.first.name).to eq("Toni")
      expect(items.last.id).to eq(3)
      expect(items.last.name).to eq("Dan")
    end

    it "finds multiple items by updated_at JSON string" do
      load_items
      date = (Date.today - 2).to_json
      items = ItemFinder.find_multiple(updated_at: date)

      expect(items.first.id).to eq(1)
      expect(items.first.name).to eq("Toni")
      expect(items.last.id).to eq(3)
      expect(items.last.name).to eq("Dan")
    end
  end

  def load_items
    merchant1 = create(:merchant, id: 1)
    merchant2 = create(:merchant, id: 2)

    create(:item, id: 1,
                  name: "Toni",
                  description: "Rib",
                  unit_price: "123.45",
                  merchant_id: 1,
                  created_at: Date.today - 2,
                  updated_at: Date.today - 2)
    create(:item, id: 2,
                  name: "Toni",
                  description: "Aubrecht",
                  unit_price: "234.56",
                  merchant_id: 2,
                  created_at: Date.today - 1,
                  updated_at: Date.today - 1)
    create(:item, id: 3,
                  name: "Dan",
                  description: "Rib",
                  unit_price: "123.45",
                  merchant_id: 2,
                  created_at: Date.today - 2,
                  updated_at: Date.today - 2)
  end
end
