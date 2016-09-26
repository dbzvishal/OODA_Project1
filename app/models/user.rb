class User < ApplicationRecord
  has_many :bookings, :dependent => :delete_all
  has_and_belongs_to_many :teams

  def setMember
    self.utype = 'member'
  end
  def setAdmin
    self.utype = 'admin'
  end
  def self.get_members_only
    @members = User.all.select {|useradmin| useradmin.utype == "member"}
    @members
  end
  def self.get_admins_only
    @admins = User.all.select {|useradmin| useradmin.utype == "admin"}
    @admins
  end
  def self.does_user_exist? userinfo
    return !(User.where('uname = ? or uemail = ?', userinfo, userinfo).empty?)
  end
  def self.get_user userinfo
    return User.where('uname = ? or uemail = ?', userinfo, userinfo).first
  end
  def self.get_users_of_team team_id
    list = User.joins(:teams).where('team_id = ?', team_id).collect { |x| x.id}
    return list
  end
  def self.is_notification_needed? user_id
    !User.find(user_id).notification.nil?
  end
  def self.get_notification_data_and_clear user_id
    user_obj = User.find(user_id)
    notification = user_obj.notification.to_s
    notification.split '-'
    uname = User.find(notification.first).uname
    tname = Team.find(notification.last).name

    # Clearing the notification
    user_obj.update(notification: nil)

    [uname, tname]
  end

  def is_user_in_team? team_id
    return !(User.joins(:teams).where('user_id = ? and team_id = ?', self.id, team_id).empty?)
  end
end