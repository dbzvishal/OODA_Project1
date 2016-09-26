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
  def is_user_in_team? team_id
    return !(User.joins(:teams).where('user_id = ? and team_id = ?', self.id, team_id).empty?)
  end
end