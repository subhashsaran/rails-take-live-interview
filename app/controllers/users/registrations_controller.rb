class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :authenticate_user!

  def create
    build_resource
    if resource.save
      #UserMailer.delay.register(resource.id).deliver
      #UserMailer.register(resource.id).deliver
      #if resource.active?
      set_flash_message :notice, :signed_up
      sign_in_and_redirect(resource_name, resource)
      #sign_in(resource_name, resource)
      #redirect_to "/dashboard"
       #redirect_to '/sign_in'
      #else
      #  set_flash_message :notice, :inactive_signed_up, :reason => resource.inactive_message.to_s
      #  expire_session_data_after_sign_in!
      #  redirect_to after_inactive_sign_up_path_for(resource)
      #end
    else
      #render_with_scope :new
      redirect_to '/login'
    end
  end

end