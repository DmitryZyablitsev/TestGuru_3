class Users::SessionsController < Devise::SessionsController

  # POST /resource/sign_in
  def create
    super
    flash[:notice] = "Привет, #{current_user.first_name}!"
  end
end
