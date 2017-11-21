class Tweet < ApplicationRecord

  belongs_to :user
  has_many :tweet_likes, dependent: :delete_all
  has_many :likers, class_name: "User", through: :tweet_likes


  validates :description, presence: true,
                          length: { in: 1..240}
  validates_presence_of :user_id
end
