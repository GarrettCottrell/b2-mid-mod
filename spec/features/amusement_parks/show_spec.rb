# frozen_string_literal: true

require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit /amusement_parks/:id' do
    before :each do
      @amusementpark_1 = AmusementPark.create(
          name:     "Fun Times",
          price_of_admissions:  "$25")
      @amusementpark_2 = AmusementPark.create(
          name:     "Ball of Fun",
          price_of_admissions:  "$40")
      @amusementpark_3 = AmusementPark.create(
          name:     "Great Adventures",
          price_of_admissions:  "$10")
    end

    it 'The visitor sees the name and price of admissions for that park' do
      visit "/amusementparks/#{@amusementpark_1.id}"
      expect(page).to have_content("#{@amusementpark_1.name}")
      expect(page).to have_content("Admissions: #{@amusementpark_1.price_of_admissions}")
    end
  end
end
