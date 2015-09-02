class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :verify_authenticity_token, :only => [:open_id]

  def open_id

    @user = User.find_for_open_id(request.env["omniauth.auth"], current_user)

    if @user && @user.persisted?
      if @user.active_for_authentication?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Open ID"
        sign_in_and_redirect @user, :event => :authentication
      else
        expire_session_data_after_sign_in!
        set_flash_message :notice, :"signed_up_but_#{@user.inactive_message}"
        redirect_to new_user_session_url
      end
    else
      if registration_disabled?
        redirect_to new_user_session_path
        return
      end
      if @user
        data = @user.attributes.with_indifferent_access.slice(:login, :email, :firstname, :lastname)
        session["devise.open_id_data"] = data
      end
      redirect_to new_user_registration_url
    end
  end
  
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
  
end
