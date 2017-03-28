class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  include Pundit  
  protect_from_forgery
  rescue_from Pundit::NotAuthorizedError, with: :access_denied
  protect_from_forgery with: :exception


  private

  def access_denied(exception) 
    redirect_to users_path, :alert => "Access denied." 
  end
end
