class SolarSystemsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @solar_systems = Moon.select(:location_id).uniq
  end

  def show
    @id = params[:id]
    @moons = Moon.where("location_id = ?", params[:id])
    @known_moon_count = Moon.where("location_id = ?", params[:id]).count

    respond_to do |format|
      format.html # show.html.erb
    end
  end
end
