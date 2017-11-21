module ApplicationHelper
  include TweetGetter
  def flash_messages()
    render(partial: 'applications/flash_messages')
  end

  def tweet_list()
    @tweetList = get_all_tweet_list
    render(partial:'applications/tweet_list', local: @tweetList)
  end

  def my_tweet_list(user)
    @tweetList = get_my_tweet_list(user.tweets)
    puts user.tweets.class
    render(partial:'applications/tweet_list', local: @tweetList)
  end
end