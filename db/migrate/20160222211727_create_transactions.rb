class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      enable_extension "citext"

      t.references :invoice, index: true, foreign_key: true
      t.citext :credit_card_number
      t.citext :result

      t.timestamps null: false
    end
  end
end
