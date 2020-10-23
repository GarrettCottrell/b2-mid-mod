# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  describe 'relationships' do
    it {should have_many :rides}
  end

  describe "instance methods" do
    it ".rating" do
      @amusementpark_1 = AmusementPark.create(
          name:     "Fun Times",
          price_of_admissions:  "$25")
      @ride_1 = Ride.create(
          name:     "RollerCoaster",
          thrill_rating:  8,
          amusement_park_id: @amusementpark_1.id)
      @ride_2 = Ride.create(
          name:     "Splashdown",
          thrill_rating:  3,
          amusement_park_id: @amusementpark_1.id)
      @ride_3 = Ride.create(
          name:     "DropZone",
          amusement_park_id: @amusementpark_1.id,
          thrill_rating:  6)
      expect(@amusementpark_1.rating).to eq(5.67)
      end
    end
  end
