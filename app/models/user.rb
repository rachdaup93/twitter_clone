class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tweets
  has_many :tweet_likes, dependent: :delete_all
  has_many :likes, class_name: "Tweet", through: :tweet_likes, source: :tweet

  has_many :followee_followships, foreign_key: :follower_id, class_name: "Followship", dependent: :destroy
  has_many :followees, through: :followee_followships, source: :followee

  has_many :follower_followships, foreign_key: :followee_id, class_name: "Followship", dependent: :destroy
  has_many :followers, through: :follower_followships, source: :follower
  
end