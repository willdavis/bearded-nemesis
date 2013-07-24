class SolarSystemsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @solar_systems = Moon.select(:location_id).uniq
  end

  def show
    @id = params[:id]
    @moons = Moon.where("location_id = ?", params[:id])
    @known_moon_count = @moons.count
  end
end
