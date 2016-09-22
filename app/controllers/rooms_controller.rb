class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  $room_sizes = %w[Small Medium Large]
  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
  end

  # GET /rooms/new
  def new
    @room = Room.new
    @buildings = Building.all.collect {|p| [ p.bname, p.id ] }
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)
    @room.set_available!
    @room.size = Room.get_size params['room']['size']
    respond_to do |format|
      if Room.where("rnumber = ? and building_id = ?", params['room']['rnumber'], params['room']['building_id']).empty?
        if @room.save
          format.html { redirect_to rooms_path, notice: 'Room was successfully created' }
        else
          format.html { render :new, alert: 'Error occurred while creating room' + @room.valid?.to_s }
        end
      else
        format.html { redirect_to add_room_path, alert: 'Room ID is already in database' }
    end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find_by_rnumber(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:rnumber, :size, :building_id)
    end
end
