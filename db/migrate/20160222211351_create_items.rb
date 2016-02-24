class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      enable_extension "citext"

      t.citext :name
      t.citext :description
      t.decimal :unit_price, precision: 8, scale: 2
      t.references :merchant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
