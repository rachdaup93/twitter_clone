class ProfileController < ApplicationController
  include UserGetter
  before_action :confirm_logged_in, only: [:index, :personal]

  def index
    @currentUser = current_user
    @potentialFollows = get_other_users
  end

  def personal
    @currentUser = current_user
    @potentialFollows = get_other_users
    @personal = true
    render(:index)
  end
end
