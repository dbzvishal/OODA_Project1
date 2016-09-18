json.extract! user, :id, :uname, :uemail, :uphone, :password, :created_at, :updated_at
json.url user_url(user, format: :json)