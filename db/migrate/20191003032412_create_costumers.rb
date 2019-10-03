class CreateCostumers < ActiveRecord::Migration
  def change
    create_table :costumers do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
