require "rails_helper"

# User Story 1, Flights Index Page

# As a visitor
# When I visit the flights index page
# I see a list of all flight numbers
# And next to each flight number I see the name of the Airline of that flight
# And under each flight number I see the names of all that flight's passengers

# User Story 2, Remove a Passenger from a Flight

# As a visitor
# When I visit the flights index page
# Next to each passengers name
# I see a link or button to remove that passenger from that flight
# When I click on that link/button
# I'm returned to the flights index page
# And I no longer see that passenger listed under that flight,
# And I still see the passenger listed under the other flights they were assigned to.

RSpec.describe "Flights index spec" do
  before(:each) do
    @airline1 = Airline.create!(name: "Alaska")
    @airline2 = Airline.create!(name: "Southwest")
    @airline3 = Airline.create!(name: "San Juan")

    @flight1 = @airline1.flights.create!(number: "1a", date: "May.1.2023", departure_city: "Seattle", arrival_city: "Denver")
    @flight2 = @airline2.flights.create!(number: "2a", date: "May.2.2023", departure_city: "Portland", arrival_city: "Spokane")
    @flight3 = @airline3.flights.create!(number: "3a", date: "May.3.2023", departure_city: "San Fran", arrival_city: "Las Vegas")

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

    @fp7 = FlightsPassenger.create(flight_id: @flight3.id, passenger_id: @pass3.id)

    visit flights_path
  end
    it "see all flight numbers" do
      expect(page).to have_content(@flight1.number)
      expect(page).to have_content(@flight2.number)
      expect(page).to have_content(@flight3.number)
    end

    it "see name of Airline next to flight number" do
      within("#flight-#{@flight1.id}") do
        expect(page).to have_content(@airline1.name)
        expect(page).to_not have_content(@airline2.name)
        expect(page).to_not have_content(@airline3.name)
      end

      within("#flight-#{@flight2.id}") do
        expect(page).to have_content(@airline2.name)
        expect(page).to_not have_content(@airline3.name)
        expect(page).to_not have_content(@airline1.name)
      end

      within("#flight-#{@flight3.id}") do
        expect(page).to have_content(@airline3.name)
        expect(page).to_not have_content(@airline1.name)
        expect(page).to_not have_content(@airline2.name)
      end
    end

    it "can delete passenger from flight" do
      within("#flight-#{@flight2.id}") do
        expect(page).to have_button("Remove Paul")
        click_button("Remove Paul")
        expect(current_path).to eq(flights_path)
        expect(page).to_not have_content("Paul")
      end
      within("#flight-#{@flight3.id}") do
        expect(page).to have_button("Remove Paul")
      end
    end
end