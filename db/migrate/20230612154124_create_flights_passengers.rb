class CreateFlightsPassengers < ActiveRecord::Migration[7.0]
  def change
    create_table :flights_passengers do |t|
      t.references :flights, null: false, foreign_key: true
      t.references :passengers, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
