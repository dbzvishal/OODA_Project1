class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :logoutAuth

  protected
  def logoutAuth
    unless User.find_by(id: session[:user_id])
      redirect_to root_path, alert: "You are trying to access a page that requires authorization"
    end
  end
end
