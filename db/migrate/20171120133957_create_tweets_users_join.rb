class CreateTweetsUsersJoin < ActiveRecord::Migration[5.1]
  def up
    create_table :tweet_likes, id: false do |t|
      t.integer :user_id
      t.integer :tweet_id
    end
    add_index :tweet_likes, ["user_id","tweet_id"]
  end

  def down
    drop_table :tweet_likes
  end
end
