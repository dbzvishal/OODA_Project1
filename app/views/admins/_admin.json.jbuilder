json.extract! admin, :id, :aname, :aemail, :aphone, :apassword, :created_at, :updated_at
json.url admin_url(admin, format: :json)