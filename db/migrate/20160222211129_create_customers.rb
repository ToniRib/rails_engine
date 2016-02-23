class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      enable_extension "citext"

      t.citext :first_name
      t.citext :last_name

      t.timestamps null: false
    end
  end
end
