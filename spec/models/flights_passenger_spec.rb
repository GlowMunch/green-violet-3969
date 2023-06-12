require "rails_helper"

RSpec.describe FlightsPassenger, type: :model do
  describe "its alive" do
    it "exists" do
    end
  end

  describe "relationships" do
    it { should belong_to :flight }
    it { should belong_to :passenger }
  end
end