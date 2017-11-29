class FollowsController < ApplicationController

  def update
    @currentUser = current_user
    @follower = User.find_by_id(params[:id])
    puts @follower
    @currentUser.followees << @follower
    if @currentUser.followees.include?(@follower)
      flash[:notice] = "You are now following #{@follower.full_name}"
    else
      flash[:error] = "Something else happened"
    end
    redirect_to '/'

  end
  def destroy
    @currentUser = current_user
    @follower = User.find_by_id(params[:id])
    puts @follower
    @currentUser.followees.delete(@follower)
    if @currentUser.followees.include?(@follower)
      flash[:error] = ["Something else happened"]
    else
      flash[:notice] = "You unfollowed #{@follower.full_name}"
    end
    redirect_to '/'

  end
end
