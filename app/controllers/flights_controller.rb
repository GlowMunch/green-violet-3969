class FlightsController < ApplicationController

  def index
    @flights = Flight.all
    @airline = Airline.all
  end

  # private
  # def flight_params
  #   params.permit(:flight, :id, :number, :date, :departure_city, :arrival_city)
  # end
end