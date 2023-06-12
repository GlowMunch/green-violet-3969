class FlightsController < ApplicationController

  def index
    @flights = Flight.all
    @airline = Airline.all
  end
end