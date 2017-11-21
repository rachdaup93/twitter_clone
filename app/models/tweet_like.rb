class TweetLike < ApplicationRecord
  belongs_to :liker, class_name: "User", foreign_key: :user_id
  belongs_to :tweet
end