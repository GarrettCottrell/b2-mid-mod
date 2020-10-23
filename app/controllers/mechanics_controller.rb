# frozen_string_literal: true

class MechanicsController < ApplicationController
  def index
  @mechanics = Mechanic.all
  end
end
