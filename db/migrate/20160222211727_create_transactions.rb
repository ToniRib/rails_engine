class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :invoice, index: true, foreign_key: true
      t.integer :credit_card_number
      t.datetime :credit_card_expiration_date
      t.integer :result
      t.string :created_at
      t.string :updated_at
    end
  end
end
