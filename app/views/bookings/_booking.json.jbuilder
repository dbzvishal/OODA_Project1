json.extract! booking, :id, :date, :timefrom, :timeto, :created_at, :updated_at
json.url booking_url(booking, format: :json)