class UpdateFlightsPassengers < ActiveRecord::Migration[7.0]
  def change
    rename_column :flights_passengers, :flights_id, :flight_id
    rename_column :flights_passengers, :passengers_id, :passenger_id
  end
end