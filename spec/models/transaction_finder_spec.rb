require "rails_helper"

RSpec.describe TransactionFinder, type: :model do
  describe "#find_single" do
    it "finds single transaction by id" do
      load_transactions
      transaction = TransactionFinder.find_single(id: 1)

      expect(transaction.id).to eq(1)
    end

    it "finds single transaction by invoice_id" do
      load_transactions
      transaction = TransactionFinder.find_single(invoice_id: 1)
      expect(transaction.id).to eq(1)
      expect(transaction.invoice_id).to eq(1)

      transaction = TransactionFinder.find_single(invoice_id: 2)
      expect(transaction.id).to eq(2)
      expect(transaction.invoice_id).to eq(2)
    end

    it "finds single transaction by credit_card_number" do
      load_transactions
      transaction = TransactionFinder.find_single(credit_card_number: "4242424242424242")
      expect(transaction.id).to eq(1)
      expect(transaction.credit_card_number).to eq("4242424242424242")

      transaction = TransactionFinder.find_single(credit_card_number: "8484848484848484")
      expect(transaction.id).to eq(2)
      expect(transaction.credit_card_number).to eq("8484848484848484")
    end

    it "finds single transaction by result" do
      load_transactions
      transaction = TransactionFinder.find_single(result: "success")
      expect(transaction.id).to eq(1)
      expect(transaction.result).to eq("success")

      transaction = TransactionFinder.find_single(result: "failed")
      expect(transaction.id).to eq(2)
      expect(transaction.result).to eq("failed")
    end

    it "finds single transaction by created_at JSON string" do
      load_transactions
      date = (Date.today - 2).to_json
      transaction = TransactionFinder.find_single(created_at: date)
      expect(transaction.id).to eq(1)
      expect(transaction.created_at).to eq(Date.today - 2)

      date = (Date.today - 1).to_json
      transaction = TransactionFinder.find_single(created_at: date)
      expect(transaction.id).to eq(2)
      expect(transaction.created_at).to eq(Date.today - 1)
    end

    it "finds single transaction by updated_at JSON string" do
      load_transactions
      date = (Date.today - 2).to_json
      transaction = TransactionFinder.find_single(updated_at: date)
      expect(transaction.id).to eq(1)
      expect(transaction.updated_at).to eq(Date.today - 2)

      date = (Date.today - 1).to_json
      transaction = TransactionFinder.find_single(updated_at: date)
      expect(transaction.id).to eq(2)
      expect(transaction.updated_at).to eq(Date.today - 1)
    end
  end


  describe "#find_multiple" do
    it "finds one transaction by id" do
      load_transactions
      transactions = TransactionFinder.find_multiple(id: 1)

      expect(transactions.first.id).to eq(1)
    end

    it "finds multiple transactions by invoice id" do
      load_transactions
      transactions = TransactionFinder.find_multiple(invoice_id: 2)

      expect(transactions.first.id).to eq(2)
      expect(transactions.first.invoice_id).to eq(2)
      expect(transactions.last.id).to eq(3)
      expect(transactions.last.invoice_id).to eq(2)
    end

    it "finds multiple transactions by credit card number" do
      load_transactions
      transactions = TransactionFinder.find_multiple(credit_card_number: "4242424242424242")

      expect(transactions.first.id).to eq(1)
      expect(transactions.first.credit_card_number).to eq("4242424242424242")
      expect(transactions.last.id).to eq(3)
      expect(transactions.last.credit_card_number).to eq("4242424242424242")
    end

    it "finds multiple transactions by result" do
      load_transactions
      transactions = TransactionFinder.find_multiple(result: "success")

      expect(transactions.first.id).to eq(1)
      expect(transactions.first.result).to eq("success")
      expect(transactions.last.id).to eq(3)
      expect(transactions.last.result).to eq("success")
    end

    it "finds multiple transactions by created_at JSON string" do
      load_transactions
      date = (Date.today - 2).to_json
      transactions = TransactionFinder.find_multiple(created_at: date)

      expect(transactions.first.id).to eq(1)
      expect(transactions.first.created_at).to eq(Date.today - 2)
      expect(transactions.last.id).to eq(3)
      expect(transactions.last.created_at).to eq(Date.today - 2)
    end

    it "finds multiple transactions by updated_at JSON string" do
      load_transactions
      date = (Date.today - 2).to_json
      transactions = TransactionFinder.find_multiple(updated_at: date)

      expect(transactions.first.id).to eq(1)
      expect(transactions.first.updated_at).to eq(Date.today - 2)
      expect(transactions.last.id).to eq(3)
      expect(transactions.last.updated_at).to eq(Date.today - 2)
    end
  end

  def load_transactions
    invoice1 = create(:invoice, id: 1)
    invoice2 = create(:invoice, id: 2)

    create(:transaction, id: 1,
                         invoice_id: 1,
                         credit_card_number: "4242424242424242",
                         result: "success",
                         created_at: Date.today - 2,
                         updated_at: Date.today - 2)
    create(:transaction, id: 2,
                         invoice_id: 2,
                         credit_card_number: "8484848484848484",
                         result: "failed",
                         created_at: Date.today - 1,
                         updated_at: Date.today - 1)
    create(:transaction, id: 3,
                         invoice_id: 2,
                         credit_card_number: "4242424242424242",
                         result: "success",
                         created_at: Date.today - 2,
                         updated_at: Date.today - 2)
  end
end
