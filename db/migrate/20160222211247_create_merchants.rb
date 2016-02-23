class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      enable_extension "citext"

      t.citext :name

      t.timestamps null: false
    end
  end
end
