class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
  end

  def current_user
	@current_user ||= User.find_by(id: cookies.signed[:user_id])
  end

  def is_user_logged_in?
  	logged_in = current_user.present?
	if logged_in then true else redirect_to root_path end 
  end
end
