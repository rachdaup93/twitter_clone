class CreateFollowers < ActiveRecord::Migration[5.1]
  def up
    create_table :followships do |t|
      t.integer :follower_id
      t.integer :followee_id
      t.timestamps
    end
    add_index :followships, [:follower_id, :followee_id]
  end

  def down
    drop_table :followships
  end
end
