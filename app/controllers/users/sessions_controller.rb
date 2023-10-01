class Users::SessionsController < Devise::SessionsController

  # POST /resource/sign_in
  def create
    flash[:notice] = "Привет, #{current_user.first_name}!"
    (current_user.type == 'Admin') ? (redirect_to admin_tests_path) : (redirect_to tests_path)    
  end
end
