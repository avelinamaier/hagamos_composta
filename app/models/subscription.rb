class Subscription < ApplicationRecord
  has_many :users, through: :bookings
end
