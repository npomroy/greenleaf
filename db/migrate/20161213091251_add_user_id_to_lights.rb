class AddUserIdToLights < ActiveRecord::Migration[5.0]
  def change
    add_column :lights, :user_id, :integer
  end
end
