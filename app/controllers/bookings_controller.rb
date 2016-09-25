class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]

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
    room_id = params['room_radio']
    @room = Room.find(room_id)
    @booking = Booking.new(booking_params)
    @booking.room_id = room_id
    if(@booking.user_id.nil?)
      @booking.user_id = session[:user_id]
    end
    respond_to do |format|

      # Validation
      response_str = validate
      unless response_str == ''
        initial_val
        redirect_to add_booking_path, notice: response_str
        return
      end

      if @booking.save
        if @admin
          user_id = @booking.user_id
          @booking = Booking.get_user_bookings user_id
          @user_name = User.select("uname").find(user_id).uname
          format.html { redirect_to show_booking_path(user_id), notice: 'Booking was successfully created.' }
        else
          format.html { redirect_to user_bookings_path, notice: 'Booking was successfully created.' }
        end
      else
        format.html { redirect_to :new, alert: 'An error occurred and booking did not happen.' }
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
      format.html { redirect_to options_path, notice: 'Booking was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

  def set_booking
    @booking = Booking.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def booking_params
    params.require(:booking).permit(:date, :timefrom, :timeto, :room_id, :room_radio)
  end

  def initial_val
    @users = User.all.collect {|p| [ p.uname, p.id ] }
    @buildings = Building.all.collect {|p| [ p.bname, p.id] }
    @rooms = []
  end

  def validate
    response_str = '';
    if (@booking.timeto < @booking.timefrom)
      response_str = 'End time must be greater than start time'
    elsif @booking.timefrom < @currentZone.at(Time.now)
      response_str = 'Start time cannot be lesser than current time'
    elsif @booking.timeto == @booking.timefrom
      response_str = 'Start time cannot be equal to End time'
    elsif @booking.timeto - @booking.timefrom > 2.hours
      response_str = 'Room cannot be booked for more than 2 hours'
    elsif @booking.timeto - @currentZone.at(Time.now) > 1.weeks
      response_str = 'Room cannot be booked ahead of a week'
    elsif @booking.is_booked? @room.building_id
      response_str = 'The room is already booked for the specified time'
    end

    response_str
  end
end