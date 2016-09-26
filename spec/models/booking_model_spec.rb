require 'rails_helper'

RSpec.describe BookingsController, :type => :model do
  it 'gets a booking for a given user id' do
    @building = Building.find_or_create_by(bname: "testbuilding")
    @room = Room.create!(rnumber: "001", size: "4", status: "available", building_id: @building.id)
    @user = User.find_or_create_by(uname: "testuser", uemail:"user@test.edu", password:"test", utype:"member")
    Booking.create!(timefrom: Time.now, timeto: Time.now+2.hours, room_id: @room.id, user_id: @user.id)
    expect(Booking.get_user_bookings(@user.id).count).to eq(1)
  end

  it 'checks if the room is already booked in a building in same time range' do
    @building = Building.find_or_create_by(bname: "testbuilding")
    @room = Room.create(rnumber: "001", size: "4", status: "available", building_id: @building.id)
    @user = User.find_or_create_by(uname: "testuser", uemail:"user@test.edu", password:"test", utype:"member")
    @booking = Booking.create!(timefrom: Time.now, timeto: Time.now+2.hours, room_id: @room.id, user_id: @user.id)
  # @room = Room.find_or_create_by(rnumber: "002", size: "4", status: "available", building_id: @building.id)
  # @booking = Booking.create(timefrom: Time.now+3.hours, timeto: Time.now+4.hours, room_id: @room.id, user_id: @user.id)
  expect(@booking.is_booked? @building.id).to eq(true)
  end
  end
# RSpec.describe User, :type => :model do
#   it "orders by last name" do
#     lindeman = User.create!(first_name: "Andy", last_name: "Lindeman")
#     chelimsky = User.create!(first_name: "David", last_name: "Chelimsky")
#
#     expect(User.ordered_by_last_name).to eq([chelimsky, lindeman])
#   end
# end
