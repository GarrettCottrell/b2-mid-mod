# frozen_string_literal: true

require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit /amusement_parks/:id' do
    before :each do
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
    end

    it 'The visitor sees the name and price of admissions for that park' do
      visit "/amusementparks/#{@amusementpark_1.id}"
      expect(page).to have_content("#{@amusementpark_1.name}")
      expect(page).to have_content("Admissions: #{@amusementpark_1.price_of_admissions}")
    end
    it 'The visitor sees the names of all the rides at the park' do
      visit "/amusementparks/#{@amusementpark_1.id}"
      expect(page).to have_content('Rides:')
      expect(page).to have_content("#{@ride_1.name}")
      expect(page).to have_content("#{@ride_2.name}")
      expect(page).to have_content("#{@ride_3.name}")
      expect(page).to have_content("Average Thrill Rating of Rides: #{@amusementpark_1.rating}")
    end
  end
end
