class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception 

  before_action :authenticate_user!, except: [:index, :show]
  
  def current_user 
    if devise_controller? 
      @current_user = super 
    else 
      @current_user ||= super || AnonymousUser.new     
    end 
  end


  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
