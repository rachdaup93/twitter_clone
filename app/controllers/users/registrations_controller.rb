class Users::RegistrationsController < Devise::RegistrationsController

  # GET /resource/edit
  def edit
    @user = current_user
    respond_to do |format|
      format.html
      format.js
    end
  end

  protected

  def update_resource(resource, params)
    resource.update_attributes(params)
  end

  # The default url to be used after updating a resource. You need to overwrite
  # this method in your own RegistrationsController.
  def after_update_path_for(resource)
    "/profile/personal"
  end

end
