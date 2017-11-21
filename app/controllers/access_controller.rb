class AccessController < ApplicationController
  include UserGetter
  before_action :confirm_not_logged_in, only: [:login, :attempt_login]


  def index
  end

  def login
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      foundUser = User.where(email: params[:email]).first
      if foundUser
        authUser = foundUser.authenticate(params[:password])
      end
    end
    if authUser
      session[:user_id] = authUser.id
      flash[:notice] = "You are now logged in."
      redirect_to('/profile')
    else
      flash[:error] = [ "Invalid email/password combination." ]
      redirect_to(action: :login)
    end
  end

  def logout
    session.delete :user_id
    flash[:notice] = "Logged out."
    redirect_to(action: :login)
  end

end
