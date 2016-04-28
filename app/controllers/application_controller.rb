class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Pundit
  
  # Bypass CSRF token authenticity
  skip_before_filter :verify_authenticity_token
  
  def current_user
    User.find_by_id params[:user_id]
  end

  def permission_denied
    render json: {error: 'You are not authorized to access this page'}
  end
end
