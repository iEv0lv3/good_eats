class CreateRestaurant < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|

      t.string :name, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.string :description
      t.string :category

      t.timestamps null: false
    end
  end
end
