module TweetGetter
  extend ActiveSupport::Concern
  def get_all_tweet_list
    Tweet.all.order(created_at: :desc).map {|tweet| {tweet: tweet, formattedDate: tweet.created_at.to_formatted_s(:short), author: User.find(tweet.user_id)}}
  end

  def get_my_tweet_list(tweetList)
    tweetList.map {|tweet| {tweet: tweet, formattedDate: tweet.created_at.to_formatted_s(:short), author: User.find(tweet.user_id)}}
  end
end