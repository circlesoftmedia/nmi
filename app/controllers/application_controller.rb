class ApplicationController < ActionController::Base
  protect_from_forgery
  # check_authorization
  # def after_sign_in_path_for(resource)
  #   request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  # end
  def authenticate_admin!
    if current_user
      unless current_user.role == 'admin' || current_user.role == 'super_admin' 
        flash[:alert] = "You are not authorized to access this resource!"
        redirect_to root_path
      end
    end
  end


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.role == 'admin' || resource_or_scope.role == 'super_admin' 
    	webmaster_products_path 
    else
    	root_path
    end
  end
end
