class Passenger < ApplicationRecord
  has_many :flights_passengers
  has_many :flights, through: :flights_passengers
end