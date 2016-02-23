require "rails_helper"

RSpec.describe InvoiceItemFinder, type: :model do
  describe "#find_single" do
    it "finds single invoice_item by id" do
      load_invoice_items
      invoice_item = InvoiceItemFinder.find_single(id: 1)

      expect(invoice_item.id).to eq(1)
    end

    it "finds single invoice_item by item_id" do
      load_invoice_items
      invoice_item = InvoiceItemFinder.find_single(item_id: 1)
      expect(invoice_item.id).to eq(1)
      expect(invoice_item.item_id).to eq(1)

      invoice_item = InvoiceItemFinder.find_single(item_id: 2)
      expect(invoice_item.id).to eq(2)
      expect(invoice_item.item_id).to eq(2)
    end

    it "finds single invoice_item by invoice_id" do
      load_invoice_items
      invoice_item = InvoiceItemFinder.find_single(invoice_id: 1)
      expect(invoice_item.id).to eq(1)
      expect(invoice_item.invoice_id).to eq(1)

      invoice_item = InvoiceItemFinder.find_single(invoice_id: 2)
      expect(invoice_item.id).to eq(2)
      expect(invoice_item.invoice_id).to eq(2)
    end

    it "finds single invoice_item by quantity" do
      load_invoice_items
      invoice_item = InvoiceItemFinder.find_single(quantity: 2)
      expect(invoice_item.id).to eq(1)
      expect(invoice_item.quantity).to eq(2)

      invoice_item = InvoiceItemFinder.find_single(quantity: 3)
      expect(invoice_item.id).to eq(2)
      expect(invoice_item.quantity).to eq(3)
    end

    it "finds single invoice_item by unit price" do
      load_invoice_items
      invoice_item = InvoiceItemFinder.find_single(unit_price: "123.45")
      expect(invoice_item.id).to eq(1)
      expect(invoice_item.unit_price).to eq("123.45")

      invoice_item = InvoiceItemFinder.find_single(unit_price: "234.56")
      expect(invoice_item.id).to eq(2)
      expect(invoice_item.unit_price).to eq("234.56")
    end

    it "finds single invoice_item by created_at JSON string" do
      load_invoice_items
      date = (Date.today - 2).to_json
      invoice_item = InvoiceItemFinder.find_single(created_at: date)
      expect(invoice_item.id).to eq(1)
      expect(invoice_item.created_at).to eq(Date.today - 2)

      date = (Date.today - 1).to_json
      invoice_item = InvoiceItemFinder.find_single(created_at: date)
      expect(invoice_item.id).to eq(2)
      expect(invoice_item.created_at).to eq(Date.today - 1)
    end

    it "finds single invoice_item by updated_at JSON string" do
      load_invoice_items
      date = (Date.today - 2).to_json
      invoice_item = InvoiceItemFinder.find_single(updated_at: date)
      expect(invoice_item.id).to eq(1)
      expect(invoice_item.updated_at).to eq(Date.today - 2)

      date = (Date.today - 1).to_json
      invoice_item = InvoiceItemFinder.find_single(updated_at: date)
      expect(invoice_item.id).to eq(2)
      expect(invoice_item.updated_at).to eq(Date.today - 1)
    end
  end

  describe "#find_multiple" do
    it "finds one invoice_item by id" do
      load_invoice_items
      invoice_items = InvoiceItemFinder.find_multiple(id: 1)

      expect(invoice_items.first.id).to eq(1)
    end

    it "finds multiple invoice_items by invoice id" do
      load_invoice_items
      invoice_items = InvoiceItemFinder.find_multiple(invoice_id: 2)

      expect(invoice_items.first.id).to eq(2)
      expect(invoice_items.first.invoice_id).to eq(2)
      expect(invoice_items.last.id).to eq(3)
      expect(invoice_items.last.invoice_id).to eq(2)
    end

    it "finds multiple invoice_items by item id" do
      load_invoice_items
      invoice_items = InvoiceItemFinder.find_multiple(item_id: 2)

      expect(invoice_items.first.id).to eq(2)
      expect(invoice_items.first.item_id).to eq(2)
      expect(invoice_items.last.id).to eq(3)
      expect(invoice_items.last.item_id).to eq(2)
    end

    it "finds multiple invoice_items by unit price" do
      load_invoice_items
      invoice_items = InvoiceItemFinder.find_multiple(unit_price: "123.45")

      expect(invoice_items.first.id).to eq(1)
      expect(invoice_items.first.unit_price).to eq("123.45")
      expect(invoice_items.last.id).to eq(3)
      expect(invoice_items.last.unit_price).to eq("123.45")
    end

    it "finds multiple invoice_items by quantity" do
      load_invoice_items
      invoice_items = InvoiceItemFinder.find_multiple(quantity: 2)

      expect(invoice_items.first.id).to eq(1)
      expect(invoice_items.first.quantity).to eq(2)
      expect(invoice_items.last.id).to eq(3)
      expect(invoice_items.last.quantity).to eq(2)
    end

    it "finds multiple invoice_items by created_at JSON string" do
      load_invoice_items
      date = (Date.today - 2).to_json
      invoice_items = InvoiceItemFinder.find_multiple(created_at: date)

      expect(invoice_items.first.id).to eq(1)
      expect(invoice_items.first.created_at).to eq(Date.today - 2)
      expect(invoice_items.last.id).to eq(3)
      expect(invoice_items.last.created_at).to eq(Date.today - 2)
    end

    it "finds multiple invoice_items by updated_at JSON string" do
      load_invoice_items
      date = (Date.today - 2).to_json
      invoice_items = InvoiceItemFinder.find_multiple(updated_at: date)

      expect(invoice_items.first.id).to eq(1)
      expect(invoice_items.first.updated_at).to eq(Date.today - 2)
      expect(invoice_items.last.id).to eq(3)
      expect(invoice_items.last.updated_at).to eq(Date.today - 2)
    end
  end

  def load_invoice_items
    item1    = create(:item, id: 1)
    item2    = create(:item, id: 2)
    invoice1 = create(:invoice, id: 1)
    invoice2 = create(:invoice, id: 2)

    create(:invoice_item, id: 1,
                          item_id: 1,
                          invoice_id: 1,
                          quantity: 2,
                          unit_price: "123.45",
                          created_at: Date.today - 2,
                          updated_at: Date.today - 2)
    create(:invoice_item, id: 2,
                          item_id: 2,
                          invoice_id: 2,
                          quantity: 3,
                          unit_price: "234.56",
                          created_at: Date.today - 1,
                          updated_at: Date.today - 1)
    create(:invoice_item, id: 3,
                          item_id: 2,
                          invoice_id: 2,
                          quantity: 2,
                          unit_price: "123.45",
                          created_at: Date.today - 2,
                          updated_at: Date.today - 2)
  end
end
