class CreateCostumers < ActiveRecord::Migration
  def change
    create_table :costumers do |t|
      t.string :name
      t.string :email
      t.string :password
      t.timestamps null: false
    end
  end
end
