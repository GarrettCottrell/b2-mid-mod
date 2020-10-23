# frozen_string_literal: true

class AmusementPark < ApplicationRecord
  has_many :rides

def rating
  self.rides.average(:thrill_rating).round(2)
  end
end
