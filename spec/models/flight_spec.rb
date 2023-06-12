require "rails_helper"

RSpec.describe Flight, type: :model do
  describe "relationships" do
    it { should belong_to :airline }
    it { should have_many(:flights_passengers) }
    it { should have_many(:passengers).through(:flights_passengers) }
  end
end

describe "methods" do
  before(:each) do
    @airline1 = Airline.create!(name: "Alaska")
    @airline2 = Airline.create!(name: "Southwest")
    @airline3 = Airline.create!(name: "San Juan")

    @flight1 = @airline1.flights.create!(number: "1a", date: "May.1.2023", departure_city: "Seattle", arrival_city: "Denver")
    @flight2 = @airline2.flights.create!(number: "2a", date: "May.2.2023", departure_city: "Portland", arrival_city: "Spokane")
    @flight3 = @airline3.flights.create!(number: "3a", date: "May.3.2023", departure_city: "San Fran", arrival_city: "Las Vegas")
  end
  it "can find its airline" do
    expect(@flight1.airline_name).to eq("Alaska")
  end
end