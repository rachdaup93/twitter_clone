class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    if session[:user_id]
      render "access/index"
    else
      render "users/new"
    end
  end

  private

  def confirm_logged_in
    return if session[:user_id]
    flash[:error] = ["Please log in."]
    redirect_to "/login"
  end

  def confirm_not_logged_in
    return unless session[:user_id]
    redirect_to "/profile"
  end

  def current_user
    User.find_by_id(session[:user_id])
  end

end