class UsersController < ApplicationController
  before_action :set_user, only: [:show, :new, :edit, :update, :options, :index, :admin_index]
  before_action :set_temp_user, only: [:destroy]
  skip_before_action :logoutAuth, only: [:new, :create]
  before_action only: [:new, :create] { logoutAuth(false) }

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @users = User.get_members_only
  end
  def admin_index
    @users = User.all
    @users = User.get_admins_only
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
        if(!@user.utype)
          @user.setMember
        end
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
    respond_to do |format|
      if @user.uname == 'SuperAdmin'
        flash[:alert] = 'SuperAdmin cannot be updated.'
        format.html { redirect_to action: 'edit'}
      elsif @user.update(user_params)
        format.html { redirect_to users_path, notice: 'Successfully updated.' }
        format.json { head :no_content }
      else
        flash[:alert] = 'Error occurred'
        format.html { redirect_to action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    respond_to do |format|
      if @input_user.destroy
        format.html { redirect_to users_index_path, alert: 'User was successfully deleted.' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      unless session[:user_id].nil?
        @user = User.find(session[:user_id])
      end
    end

    def set_temp_user
      @input_user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:uname, :uemail, :password, :utype)
    end
end
