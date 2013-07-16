class SolarSystemsController < ApplicationController
  def index
    @solar_systems = Moon.select(:location_id).uniq
  end

  def show
    @id = params[:id]
    @moons = Moon.where("location_id = ?", params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end
end
