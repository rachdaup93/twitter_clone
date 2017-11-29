class ProfileController < ApplicationController
  include UserGetter

  def index
    @currentUser = current_user
    puts @currentUser.inspect
    @potentialFollows = get_other_users
  end

  def personal
    @currentUser = current_user
    @potentialFollows = get_other_users
  end
end