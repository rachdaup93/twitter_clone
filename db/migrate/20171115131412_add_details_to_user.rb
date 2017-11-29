class AddDetailsToUser < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :full_name, :string
  end

  def down
    remove_column :user, :full_name
  end
end
