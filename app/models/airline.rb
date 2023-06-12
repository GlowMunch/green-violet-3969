class Airline < ApplicationRecord
   has_many :flights
   has_many :flights_passengers, through: :flights
   has_many :passengers, through: :flights_passengers

   def adult_passengers
      self.passengers.where("passengers.age >= 18").distinct
   end
end