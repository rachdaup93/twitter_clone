class AddLocationToUser < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :location, :string, default: "Update your location."
  end

  def down
    remove_column :users, :location
  end
end