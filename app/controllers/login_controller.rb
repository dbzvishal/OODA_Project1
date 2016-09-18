class LoginController < ApplicationController
  skip_before_action :logoutAuth

  def index
    @users = User.new
  end

  def show
    @current_user = User.where("(uemail = ? OR uname = ?) AND password = ?", params[:user][:uname], params[:user][:uname], params[:user][:pass])

    respond_to do |format|
      if @current_user.empty?
        format.html { redirect_to root_path, alert: 'Username/Password was not entered correctly.' }
      else
        session[:user_id] = @current_user.first.id
        format.html { redirect_to options_path }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    @users = User.new
    redirect_to login_path
  end
end
