class User < ApplicationRecord
  # Include default users modules. Others available are:
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

  has_attached_file :avatar, styles: {
      thumb: '32x32#',
      normal: '72x72#',
      medium: '200x200#'
  }, default_style: :normal

  has_attached_file :cover

  validates_attachment_content_type :avatar , content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :cover , content_type: /\Aimage\/.*\Z/
  
end