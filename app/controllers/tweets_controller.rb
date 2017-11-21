class TweetsController < ApplicationController
  include TweetGetter
  before_action :confirm_logged_in

  def index
    @tweetList = get_tweet_list
  end

  def new
    @user = current_user
    @newtweet = Tweet.new
  end

  def create
    @newtweet = Tweet.new(tweet_params)
    @user = current_user
    @user.tweets << @newtweet
    if @newtweet.save
      flash[:notice] = "Tweet has been tweeted."
      redirect_to "/profile"
    else
      flash[:error] = @newtweet.errors.full_messages
      redirect_to action: :new
    end

  end

  def show
    tweet = Tweet.find_by_id(params[:id])
    @tweets = { tweet: tweet, author: User.find_by_id(tweet.user_id) }
  end

  def edit
    @user = current_user
    @tweet = Tweet.find_by_id(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def delete
    @tweet = Tweet.find_by_id(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    tweet = Tweet.find_by_id(params[:id])
    tweet.destroy
    redirect_to('/')
  end

  def likes
    @currentUser = current_user
    tweet = Tweet.find_by_id(params[:id])
    tweet.likes += 1
    tweet.likers << @currentUser
    if tweet.save
      @tweet = { tweet: tweet, formattedDate: tweet.created_at.to_formatted_s(:short), author: tweet.user }
    else
      flash[:error] = "Tweet could not be liked."
    end
    respond_to do |format|
      format.html { redirect_to('/') }
      format.js
    end

  end

  def update
    @tweet = Tweet.find_by_id(params[:id])
    @tweet.update_attributes(tweet_params)
    if @tweet.save
      flash[:notice] = "Tweet updated successfully."
      redirect_to('/')
    else
      redirect_to(:edit)
    end
  end

  def dislikes
    @currentUser = current_user
    tweet = Tweet.find_by_id(params[:id])
    tweet.likes -= 1
    tweet.likers.delete(current_user)
    if tweet.save
      @tweet = { tweet: tweet, formattedDate: tweet.created_at.to_formatted_s(:short), author: tweet.user }
    else
      flash[:error] = "Tweet could not be unliked."
    end
    respond_to do |format|
      format.html { redirect_to('/') }
      format.js
    end

  end

  private


  def tweet_params
    params.require(:tweet).permit(:description)
  end
end
