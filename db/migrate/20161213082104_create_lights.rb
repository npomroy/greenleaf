class CreateLights < ActiveRecord::Migration[5.0]
  def change
    create_table :lights do |t|
      t.string :name
      t.integer :light_level
      t.integer :power_usage
      t.text :description
      t.timestamps
    end
  end
end
