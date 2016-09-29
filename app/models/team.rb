class Team < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :bookings, :dependent => :delete_all

  def self.is_team_name_taken? tname
    !Team.where('name = name').empty?
  end
end
