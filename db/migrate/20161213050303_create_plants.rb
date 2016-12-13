class CreatePlants < ActiveRecord::Migration[5.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.integer :user_id
      t.integer :light_id
      t.datetime :plant_date
      t.datetime :last_turn
      t.integer :growth_stage
      t.integer :water_level
      t.text :description
      t.timestamps
    end
  end
end