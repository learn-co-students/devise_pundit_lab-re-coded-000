class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit  # add this line
  rescue_from Pundit::NotAuthorizedError, with: :access_denied
  protect_from_forgery with: :exception


  private

  def access_denied(exception)
  	
    redirect_to users_path, :alert => "Access denied." 
  end
end
