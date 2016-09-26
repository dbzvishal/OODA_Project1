require 'rails_helper'
# require 'test/unit'
# require 'test/test_helper'

RSpec.describe BookingsController, :type => :controller do
  describe "POST #create" do
  it 'creates a booking' do
    @building = Building.find_or_create_by(bname: "testbuilding")
    @room = Room.create!(rnumber: "001", size: "4", status: "available", building_id: @building.id)
    @user = User.create!(uname: "testuser", uemail:"user@test.edu", password:"test", utype:"member")
    expect {
    post :create, {:booking =>{:timefrom => Time.now+1.hour, :timeto => Time.now+2.hours,:room_id=> @room.id, :user_id =>@user.id}, :room_radio=> @room.id}
    }.to change(Booking, :count).by(1)
  end
  it "should redirect to" do
    @building = Building.find_or_create_by(bname: "testbuilding")
    @room = Room.create!(rnumber: "001", size: "4", status: "available", building_id: @building.id)
    @user = User.create!(uname: "testuser", uemail:"user@test.edu", password:"test", utype:"member")
    post :create, {:booking =>{:timefrom => Time.now+1.hour, :timeto => Time.now+2.hours,:room_id=> @room.id, :user_id =>@user.id}, :room_radio=> @room.id}
    response.should redirect_to user_bookings_path
  end
  end

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("bookings/index", "layouts/application")
    end
  end

  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :new
      expect(response).to render_template("bookings/new", "layouts/application")
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show, :id=>Booking.all.first.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it "renders the show template" do
      get :show, :id=>Booking.all.first.id
      response.should render_template :show
    end
  end

  describe "DELETE #destroy" do
    it "responds successfully with an HTTP 200 status code" do
      expect{
      delete :destroy, :id=>Booking.all.first.id
      }.to change(Booking, :count).by(-1)
    end
    it "should redirect to" do
      delete :destroy, :id=>Booking.all.first.id
      response.should redirect_to options_path
    end
  end

end
