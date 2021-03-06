class MoonsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /moons
  # GET /moons.json
  def index
    authorize! :index, Moon
    @moons = Moon.search(params)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moons }
    end
  end

  # GET /moons/1
  # GET /moons/1.json
  def show
    authorize! :show, Moon
    @moon = Moon.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @moon }
    end
  end

  # GET /moons/new
  # GET /moons/new.json
  def new
    authorize! :new, Report
    @moon = Report.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @moon }
    end
  end

  # GET /moons/1/edit
  def edit
    authorize! :edit, Report
    @moon = Moon.find(params[:id])
  end

  # POST /moons
  # POST /moons.json
  def create
    authorize! :create, Report
    @moon = Report.new(params[:moon])

    respond_to do |format|
      if @moon.save
        format.html { redirect_to @moon.moon, notice: 'Moon was successfully created.' }
        format.json { render json: @moon.moon, status: :created, location: @moon.moon }
      else
        format.html { render action: "new" }
        format.json { render json: @moon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /moons/1
  # PUT /moons/1.json
  def update
    authorize! :update, Moon
    @moon = Moon.find(params[:id])

    respond_to do |format|
      if @moon.update_attributes(params[:moon])
        format.html { redirect_to @moon, notice: 'Moon was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @moon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moons/1
  # DELETE /moons/1.json
  def destroy
    authorize! :destroy, Moon
    @moon = Moon.find(params[:id])
    @moon.destroy

    respond_to do |format|
      format.html { redirect_to moons_url }
      format.json { head :no_content }
    end
  end
end
