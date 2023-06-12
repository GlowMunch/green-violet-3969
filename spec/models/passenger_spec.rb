require "rails_helper"

RSpec.describe Passenger, type: :model do
  describe "its alive" do
    it "exists" do
    end
  end
  describe 'relationships' do
    it { should have_many(:flights_passengers) }
    it { should have_many(:flights).through(:flights_passengers) }
  end
end