class LoginController < ApplicationController
  def index
    @users = User.new
  end

  def show
    @current_user = User.where("(uemail = ? OR uname = ?) AND password = ?", params[:user][:uname], params[:user][:uname], params[:user][:pass])

    respond_to do |format|
      if @current_user.empty?
        format.html { redirect_to root_path, notice: 'Username/Password was not entered correctly.' + params[:uname].to_s }
      else
        format.html
      end
    end
  end
end
