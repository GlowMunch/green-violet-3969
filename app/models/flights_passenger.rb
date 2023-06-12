class FlightsPassenger < ApplicationRecord
  belongs_to :passenger
  belongs_to :flight

  validates_presence_of :flight_id
  validates_presence_of :passenger_id
end
