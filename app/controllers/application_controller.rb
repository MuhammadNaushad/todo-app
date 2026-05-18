class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  # user defined method
  helper_method :current_user, :logged_in?

  def current_user
     if session[:user_id]
      user = User.find_by(id: session[:user_id])
     end
    # debugger
    @current_user ||= user
    # OR
    # User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must logged in to perform this action"
      redirect_to root_path
    end
  end
end
