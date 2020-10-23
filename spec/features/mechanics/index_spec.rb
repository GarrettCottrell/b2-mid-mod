# frozen_string_literal: true

require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit /mechanics' do
    before :each do
      @mechanic_1 = Mechanic.create(
          name:     "Garrett",
          years_of_experience:  5)
       @mechanic_2 = Mechanic.create(
          name:     "Sarah",
          years_of_experience:  10)
      @mechanic_3 = Mechanic.create(
          name:     "Fred",
          years_of_experience:  2)
    end

    it "The visitor sees a header saying, 'All Mechanics' with a list of all mechanic's names and years of experience" do
      visit '/mechanics'
      expect(page).to have_css('h2', text: 'All Mechanics')
      expect(page).to have_content("#{@mechanic_1.name} - #{@mechanic_1.years_of_experience} years of experience")
      expect(page).to have_content("#{@mechanic_2.name} - #{@mechanic_2.years_of_experience} years of experience")
      expect(page).to have_content("#{@mechanic_3.name} - #{@mechanic_3.years_of_experience} years of experience")
    end
  end
end
