class User < ApplicationRecord

  has_many :tweets
  has_many :tweet_likes, dependent: :delete_all
  has_many :likes, class_name: "Tweet", through: :tweet_likes, source: :tweet

  has_many :followee_followships, foreign_key: :follower_id, class_name: "Followship", dependent: :destroy
  has_many :followees, through: :followee_followships, source: :followee

  has_many :follower_followships, foreign_key: :followee_id, class_name: "Followship", dependent: :destroy
  has_many :followers, through: :follower_followships, source: :follower

  EMAIL_REGEX = /[a-z0-9\.]+@[a-z0-9]+\.[a-z]{2,63}/i
  has_secure_password
  validates :password, length: { in: 8..76 }, on: create
  validates :email, presence: true,
                    format: { with: EMAIL_REGEX, message: "is not a valid email" }
  has_attached_file :avatar, styles: {
      thumb: '32x32#',
      normal: '72x72#',
      medium: '200x200#'
  }, default_style: :normal

  has_attached_file :cover

  validates_attachment_content_type :avatar , content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :cover , content_type: /\Aimage\/.*\Z/

end