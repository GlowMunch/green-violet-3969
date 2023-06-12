require "rails_helper"

RSpec.describe Airline, type: :model do
  describe "relationships" do
    it {should have_many(:flights)}
  end

  describe "Airline Show Page" do
    before(:each) do
      @airline1 = Airline.create!(name: "Alaska")
      @airline2 = Airline.create!(name: "Southwest")
      @airline3 = Airline.create!(name: "San Juan")

      @flight1 = @airline1.flights.create!(number: "1a", date: "May.1.2023", departure_city: "Seattle", arrival_city: "Denver")
      @flight2 = @airline2.flights.create!(number: "2a", date: "May.2.2023", departure_city: "Portland", arrival_city: "Spokane")
      @flight3 = @airline3.flights.create!(number: "3a", date: "May.3.2023", departure_city: "San Fran", arrival_city: "Las Vegas")

      @flight4 = @airline1.flights.create!(number: "3a", date: "May.3.2023", departure_city: "San Fran", arrival_city: "Las Vegas")

      @pass1 = Passenger.create!(name: "Sara", age: 20)
      @pass2 = Passenger.create!(name: "Jean", age: 10)

      @pass3 = Passenger.create!(name: "Paul", age: 20)
      @pass4 = Passenger.create!(name: "Ringo", age: 10)

      @pass5 = Passenger.create!(name: "John", age: 20)
      @pass6 = Passenger.create!(name: "Sally", age: 10)

      @fp1 = FlightsPassenger.create(flight_id: @flight1.id, passenger_id: @pass1.id)
      @fp2 = FlightsPassenger.create(flight_id: @flight1.id, passenger_id: @pass2.id)

      @fp3 = FlightsPassenger.create(flight_id: @flight2.id, passenger_id: @pass3.id)
      @fp4 = FlightsPassenger.create(flight_id: @flight2.id, passenger_id: @pass4.id)

      @fp5 = FlightsPassenger.create(flight_id: @flight3.id, passenger_id: @pass5.id)
      @fp6 = FlightsPassenger.create(flight_id: @flight3.id, passenger_id: @pass6.id)

      @fp7 = FlightsPassenger.create(flight_id: @flight4.id, passenger_id: @pass1.id)
      @fp8 = FlightsPassenger.create(flight_id: @flight4.id, passenger_id: @pass4.id)
      @fp9 = FlightsPassenger.create(flight_id: @flight4.id, passenger_id: @pass5.id)
    end

    it "can find airline passengers that are adults" do
      expect(@airline1.adult_passengers).to eq([@pass1, @pass5])
    end
  end
end
