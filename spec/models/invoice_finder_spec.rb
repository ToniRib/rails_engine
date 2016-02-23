require "rails_helper"

RSpec.describe InvoiceFinder, type: :model do
  describe "#find_single" do
    it "finds single invoice by id" do
      load_invoices
      invoice = InvoiceFinder.find_single(id: 1)

      expect(invoice.id).to eq(1)
    end

    it "finds single invoice by customer_id" do
      load_invoices
      invoice = InvoiceFinder.find_single(customer_id: 1)
      expect(invoice.id).to eq(1)
      expect(invoice.customer_id).to eq(1)

      invoice = InvoiceFinder.find_single(customer_id: 2)
      expect(invoice.id).to eq(2)
      expect(invoice.customer_id).to eq(2)
    end

    it "finds single invoice by merchant_id" do
      load_invoices
      invoice = InvoiceFinder.find_single(merchant_id: 1)
      expect(invoice.id).to eq(1)
      expect(invoice.merchant_id).to eq(1)

      invoice = InvoiceFinder.find_single(merchant_id: 2)
      expect(invoice.id).to eq(2)
      expect(invoice.merchant_id).to eq(2)
    end

    it "finds single invoice by created_at JSON string" do
      load_invoices
      date = (Date.today - 2).to_json
      invoice = InvoiceFinder.find_single(created_at: date)
      expect(invoice.id).to eq(1)
      expect(invoice.created_at).to eq(Date.today - 2)

      date = (Date.today - 1).to_json
      invoice = InvoiceFinder.find_single(created_at: date)
      expect(invoice.id).to eq(2)
      expect(invoice.created_at).to eq(Date.today - 1)
    end

    it "finds single invoice by updated_at JSON string" do
      load_invoices
      date = (Date.today - 2).to_json
      invoice = InvoiceFinder.find_single(updated_at: date)
      expect(invoice.id).to eq(1)
      expect(invoice.updated_at).to eq(Date.today - 2)

      date = (Date.today - 1).to_json
      invoice = InvoiceFinder.find_single(updated_at: date)
      expect(invoice.id).to eq(2)
      expect(invoice.updated_at).to eq(Date.today - 1)
    end
  end

  describe "#find_multiple" do
    it "finds one invoice by id" do
      load_invoices
      invoices = InvoiceFinder.find_multiple(id: 1)

      expect(invoices.first.id).to eq(1)
    end

    it "finds multiple invoices by customer id" do
      load_invoices
      invoices = InvoiceFinder.find_multiple(customer_id: 2)

      expect(invoices.first.id).to eq(2)
      expect(invoices.first.customer_id).to eq(2)
      expect(invoices.last.id).to eq(3)
      expect(invoices.last.customer_id).to eq(2)
    end

    it "finds multiple invoices by merchant id" do
      load_invoices
      invoices = InvoiceFinder.find_multiple(merchant_id: 2)

      expect(invoices.first.id).to eq(2)
      expect(invoices.first.merchant_id).to eq(2)
      expect(invoices.last.id).to eq(3)
      expect(invoices.last.merchant_id).to eq(2)
    end

    it "finds multiple invoices by status" do
      load_invoices
      invoices = InvoiceFinder.find_multiple(status: "shipped")

      expect(invoices[0].id).to eq(1)
      expect(invoices[0].status).to eq("shipped")
      expect(invoices[1].id).to eq(2)
      expect(invoices[1].status).to eq("shipped")
      expect(invoices[2].id).to eq(3)
      expect(invoices[2].status).to eq("shipped")
    end

    it "finds multiple invoices by created_at JSON string" do
      load_invoices
      date = (Date.today - 2).to_json
      invoices = InvoiceFinder.find_multiple(created_at: date)

      expect(invoices.first.id).to eq(1)
      expect(invoices.first.created_at).to eq(Date.today - 2)
      expect(invoices.last.id).to eq(3)
      expect(invoices.last.created_at).to eq(Date.today - 2)
    end

    it "finds multiple invoices by updated_at JSON string" do
      load_invoices
      date = (Date.today - 2).to_json
      invoices = InvoiceFinder.find_multiple(updated_at: date)

      expect(invoices.first.id).to eq(1)
      expect(invoices.first.updated_at).to eq(Date.today - 2)
      expect(invoices.last.id).to eq(3)
      expect(invoices.last.updated_at).to eq(Date.today - 2)
    end
  end

  def load_invoices
    merchant1 = create(:merchant, id: 1)
    merchant2 = create(:merchant, id: 2)
    customer1 = create(:customer, id: 1)
    customer2 = create(:customer, id: 2)

    create(:invoice, id: 1,
                     customer_id: 1,
                     merchant_id: 1,
                     status: "shipped",
                     created_at: Date.today - 2,
                     updated_at: Date.today - 2)
    create(:invoice, id: 2,
                     customer_id: 2,
                     merchant_id: 2,
                     status: "shipped",
                     created_at: Date.today - 1,
                     updated_at: Date.today - 1)
    create(:invoice, id: 3,
                     customer_id: 2,
                     merchant_id: 2,
                     status: "shipped",
                     created_at: Date.today - 2,
                     updated_at: Date.today - 2)
  end
end
