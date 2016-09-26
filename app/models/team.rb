class Team < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :bookings, :dependent => :delete_all
end
