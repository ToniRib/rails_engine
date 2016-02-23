class CreateInvoiceItems < ActiveRecord::Migration
  def change
    create_table :invoice_items do |t|
      enable_extension "citext"

      t.references :item, index: true, foreign_key: true
      t.references :invoice, index: true, foreign_key: true
      t.integer :quantity
      t.citext :unit_price

      t.timestamps null: false
    end
  end
end
