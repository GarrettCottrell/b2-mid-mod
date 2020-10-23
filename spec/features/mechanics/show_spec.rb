require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit /mechanics/:id' do
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
      @mechanic_1 = Mechanic.create(
          name:     "Garrett",
          years_of_experience:  5,
          ride_id: @ride_1.id)
      @mechanic_2 = Mechanic.create(
          name:     "Sarah",
          ride_id: @ride_1.id,
          years_of_experience:  10)
      @mechanic_3 = Mechanic.create(
          name:     "Fred",
          ride_id: @ride_2.id,
          years_of_experience:  2)
    end

    it "The visitor sees their name, years of experience, and names of all rides they're working on" do
      visit '/mechanics'
      expect(page).to have_content("Mechanic: #{@mechanic_1.name}")
      expect(page).to have_content("Years of Experience: #{@mechanic_1.years_of_experience}")
      expect(page).to have_content("Current rides they're working on: #{@mechanic_1.rides}")
      expect(page).to have_content("Mechanic: #{@mechanic_2.name}")
      expect(page).to have_content("Years of Experience: #{@mechanic_2.years_of_experience}")
      expect(page).to have_content("Current rides they're working on: #{@mechanic_2.rides}")
      expect(page).to have_content("Mechanic: #{@mechanic_3.name}")
      expect(page).to have_content("Years of Experience: #{@mechanic_3.years_of_experience}")
      expect(page).to have_content("Current rides they're working on: #{@mechanic_3.rides}")
    end
  end
end