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
      unit_price = row["unit_price"].to_i / 100.to_f

      Item.create(id:          row["id"],
                  name:        row["name"],
                  description: row["description"],
                  unit_price:  unit_price,
                  merchant_id: row["merchant_id"],
                  created_at:  row["created_at"],
                  updated_at:  row["updated_at"])
    end

    CSV.foreach("./vendor/assets/csvs/invoices.csv", headers: true) do |row|
      Invoice.create(row.to_h)
    end

    CSV.foreach("./vendor/assets/csvs/invoice_items.csv", headers: true) do |row|
      unit_price = row["unit_price"].to_i / 100.to_f

      InvoiceItem.create(id:         row["id"],
                         item_id:    row["item_id"],
                         invoice_id: row["invoice_id"],
                         quantity:   row["quantity"],
                         unit_price: unit_price,
                         created_at: row["created_at"],
                         updated_at: row["updated_at"])
    end

    CSV.foreach("./vendor/assets/csvs/transactions.csv", headers: true) do |row|
      Transaction.create(id:                 row["id"],
                         invoice_id:         row["invoice_id"],
                         credit_card_number: row["credit_card_number"],
                         result:             row["result"],
                         created_at:         row["created_at"],
                         updated_at:         row["updated_at"])
    end
  end
end
