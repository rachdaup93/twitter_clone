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
    @tweetList.sort! { |a,b| b[:tweet].created_at <=> a[:tweet].created_at }
    render(partial:'applications/tweet_list', local: @tweetList)
  end

  def get_avatar(user, type)
    if user.avatar.present?
      case type
        when "thumb"
          user.avatar.url(:thumb)
        when "medium"
          user.avatar.url(:medium)
        else
          user.avatar.url
      end
    else
      "profile.svg"
    end
  end

  def get_cover(user)
    if user.cover.present?
      user.cover.url
    else
      "cover.jpg"
    end
  end
end