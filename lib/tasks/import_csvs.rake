require "csv"

namespace :db do
  desc "Create models from CSV files"
  task :import_csvs => :environment do
    CSV.foreach("./vendor/assets/csvs/customers.csv", headers: true) do |row|
      Customer.create(row.to_h)
    end

    CSV.foreach("./vendor/assets/csvs/merchants.csv", headers: true) do |row|
      Merchant.create(row.to_h)
    end

    CSV.foreach("./vendor/assets/csvs/items.csv", headers: true) do |row|
      Item.create(row.to_h)
    end

    CSV.foreach("./vendor/assets/csvs/invoices.csv", headers: true) do |row|
      Invoice.create(row.to_h)
    end

    CSV.foreach("./vendor/assets/csvs/invoice_items.csv", headers: true) do |row|
      InvoiceItem.create(row.to_h)
    end

    CSV.foreach("./vendor/assets/csvs/transactions.csv", headers: true) do |row|
      result = row["result"] == "success" ? 0 : 1

      Transaction.create(id: row["id"],
                         invoice_id: row["invoice_id"],
                         credit_card_number: row["credit_card_number"],
                         result: result,
                         created_at: row["created_at"],
                         updated_at: row["updated_at"])
    end
  end
end
