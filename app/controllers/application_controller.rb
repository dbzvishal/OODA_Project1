class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :logoutAuth

  $room_sizes = %w[Small Medium Large]

  protected
  def logoutAuth(is_redirect=true)
    @zone='Eastern Time (US & Canada)'
    @currentZone = ActiveSupport::TimeZone[@zone]
    Time.zone = @zone
    if Rails.env.test?
      return
    end
    @admin = false
    @super_admin = User.where('uname = ?',"SuperAdmin").first
    @user = User.find_by(id: session[:user_id])
    unless @user.nil?
      @admin = true if @user.utype == "admin"
    else if is_redirect == true
      redirect_to root_path, alert: "You are trying to access a page that requires authorization"
         end
    end
  end
end