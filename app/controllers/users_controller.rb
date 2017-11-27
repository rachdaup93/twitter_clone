class UsersController < ApplicationController
  before_action :confirm_logged_in, only: [:edit, :destroy]
  before_action :confirm_not_logged_in, only:[:new, :create]

  def new
    @newUser = User.new()
  end

  def create
    # binding.pry
    @newUser = User.new(user_info_params)
    if @newUser.full_name.present? && @newUser.email.present? && @newUser.password.present?
      if @newUser.save
        flash[:notice] = "User was saved successfully."
        redirect_to "/login"
      else
        flash[:error] = @newUser.errors.messages.map{|key, value| "Your #{key} #{value.join(" ")}"}
        redirect_to "/signup"
      end
    else
      flash[:error] = [ "Please fill out all the fields." ]
      redirect_to "/signup"
    end
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
    @user = current_user
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @user = User.find_by_id(params[:id])
    if params[:user].present?
      @user.update_attributes(user_params)
      if @user.save
        flash[:notice] = "User updated successfully."
      else
        puts @user.errors.full_messages
      end
    else
      flash[:error] = ['Please select an image to upload.']
    end

      redirect_to(controller: :profile, action: :personal)
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy

    redirect_to(action: :index)
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password, :avatar, :cover)
    end
end