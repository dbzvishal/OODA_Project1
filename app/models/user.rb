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
end