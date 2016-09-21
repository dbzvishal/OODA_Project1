class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :options]
  skip_before_action :logoutAuth, only: [:new, :create]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  def options
  end

  # GET /users/new
  def new
    @user = User.new
    @destination = 'create'
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    respond_to do |format|
      if User.where("uname = ? or uemail = ?", params['user']['uname'], params['user']['uemail']).empty?
        @user = User.new(user_params)
        @user.setMember
        if @user.save
          format.html { redirect_to root_path, alert: 'User was successfully created.' }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to add_user_path, alert: 'Username/Email already exists' }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update

  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(session[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:uname, :uemail, :password)
    end
end
