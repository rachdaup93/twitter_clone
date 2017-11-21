class CreateTweets < ActiveRecord::Migration[5.1]
  def up
    create_table :tweets do |t|
      t.integer :user_id, null: false
      t.text :description, limit: 240
      t.integer :likes, default: 0
      t.timestamps
    end
    add_index("tweets", "user_id")
  end

  def down
    drop_table :tweets
  end
end
