class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      enable_extension "citext"

      t.references :customer, index: true, foreign_key: true
      t.references :merchant, index: true, foreign_key: true
      t.citext :status

      t.timestamps null: false
    end
  end
end
