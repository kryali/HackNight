include Koala::Facebook
class ApplicationController < ActionController::Base
  protect_from_forgery

  @@imgur_api_key = "ba2b49a329da8a5310829c0adf78585d"

  # Retrieve the current user, set the user if not already
  def current_hacker
    @current_hacker ||= Hacker.find_by_id(session[:user_id])
  end

  helper_method :current_user, :signed_in?, :redirect_to_home

  # Helper method to assign and set user in session
  def current_hacker=(hacker)
      @current_hacker = hacker
      session[:user_id] = hacker.id
  end

end
