class FollowsController < ApplicationController
  before_action :confirm_logged_in, only: [:update, :destroy]

  def update
    @currentUser = current_user
    @follower = User.find_by_id(params[:id])
    puts @follower
    @currentUser.followees << @follower
    if @currentUser.followees.include?(@follower)
      flash[:notice] = "You are now following #{@currentUser.full_name}"
    else
      flash[:error] = "Something else happened"
    end
    redirect_to('/profile')
  end

  def destroy

  end
end
