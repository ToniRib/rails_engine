class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      enable_extension "citext"

      t.citext :name
      t.citext :description
      t.citext :unit_price
      t.references :merchant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
