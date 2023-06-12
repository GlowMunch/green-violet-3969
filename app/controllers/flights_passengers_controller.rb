class FlightsPassengersController < ApplicationController

  def destroy
    fp = FlightsPassenger.find_by(flight_id: params[:id], passenger_id: params[:format])
    fp.destroy
    redirect_to "/flights"
  end

end