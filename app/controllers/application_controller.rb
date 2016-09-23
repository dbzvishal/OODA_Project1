class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :logoutAuth

  protected
  def logoutAuth
    @admin = false
    @super_admin = false
    @user = User.find_by(id: session[:user_id])
    unless @user.nil?
      @admin = true if @user.utype == "admin"
      @super_admin = true if @user.utype == "SuperAdmin"
    else
      redirect_to root_path, alert: "You are trying to access a page that requires authorization"
    end
  end
end