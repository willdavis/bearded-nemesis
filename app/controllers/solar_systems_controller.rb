class SolarSystemsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @solar_systems = Moon.select(:location_id).uniq
  end

  def show
    @id = params[:id]
    params[:location_id] = params[:id]
    params[:limit] = 150
    @moons = Moon.search(params)
  end
end
