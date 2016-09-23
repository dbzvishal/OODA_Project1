class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]
  before_action :set_user_type, only: [:new]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
  end
  def user_index
    @booking = Booking.get_user_bookings(session[:user_id])
    @user_name = User.select("uname").find(session[:user_id]).uname
    render :show
  end
  # GET /bookings/1
  # GET /bookings/1.json
  def show
    @booking = Booking.get_user_bookings params[:id]
    @user_name = User.select("uname").find(params[:id]).uname
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
    # @admin = Booking.is_admin(session[:user_id])
    @users = User.all.collect {|p| [ p.uname, p.id ] }
    @buildings = Building.all.collect {|p| [ p.bname, p.id] }
    @rooms = []
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
    if(@booking.user_id.nil?)
      @booking.user_id = session[:user_id]
    end
    respond_to do |format|
      if @booking.save
        format.html { redirect_to user_bookings_path, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to show_booking_path, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to options_path, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_user_type
    @admin = Booking.is_admin(session[:user_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def booking_params
    params.require(:booking).permit(:date, :timefrom, :timeto, :user_id, :room_id )
  end
end
