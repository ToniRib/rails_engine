class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :merchant, index: true, foreign_key: true
      t.integer :status, default: 0
      t.string :created_at
      t.string :updated_at
    end
  end
end
