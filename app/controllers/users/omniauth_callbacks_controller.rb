class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def brave_id
    puts "(brave_moonraker) Omniauth callback initiated"
    puts "(brave_moonraker) Omniauth params: #{env['omniauth.auth']}"
    
    @user = User.find_for_braveid_oauth(env['omniauth.auth'], current_user)
    
    if @user.persisted?
      sign_in_and_redirect root_path, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "BraveID") if is_navigational_format?
    else
      session["devise.brave_id_data"] = env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end
