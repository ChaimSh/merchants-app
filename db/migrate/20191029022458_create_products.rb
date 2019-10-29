class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
     t.string :name
     t.integer :price
     t.string :details
     t.integer :costumer_id
     t.timestamps null: false
   end
  end
end
