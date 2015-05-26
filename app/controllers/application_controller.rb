class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

 helper_method :mailbox, :conversation
   private

def mailbox
@mailbox ||= current_user.mailbox
end
 def conversation
 @conversation ||= mailbox.conversations.find(params[:id])
 end

  protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.for(:sign_up) << :user_name
    devise_parameter_sanitizer.for(:sign_up) << :first_name
    devise_parameter_sanitizer.for(:sign_up) << :last_name
    devise_parameter_sanitizer.for(:sign_up) << :gender
    devise_parameter_sanitizer.for(:sign_up) << :birth_date
    devise_parameter_sanitizer.for(:sign_up) << :avatar
    devise_parameter_sanitizer.for(:account_update) << :avatar
       devise_parameter_sanitizer.for(:account_update) << :user_name
    devise_parameter_sanitizer.for(:account_update) << :first_name
    devise_parameter_sanitizer.for(:account_update) << :last_name
    devise_parameter_sanitizer.for(:account_update) << :gender
    devise_parameter_sanitizer.for(:account_update) << :birth_date
  end






  #before_action :configure_permitted_parameters, if: :devise_controller?
#protected
#def configure_permitted_parameters
#devise_parameter_sanitizer.for(:sign_up) << :user_name
#devise_parameter_sanitizer.for(:sign_up) << :first_name
#devise_parameter_sanitizer.for(:sign_up) << :last_name
#devise_parameter_sanitizer.for(:sign_up) << :avatar
#devise_parameter_sanitizer.for(:sign_up) << :is_admin
#devise_parameter_sanitizer.for(:sign_up) << :status
#end














end
