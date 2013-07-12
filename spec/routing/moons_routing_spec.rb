require "spec_helper"

describe MoonsController do
  describe "routing" do

    it "routes to #index" do
      get("/moons").should route_to("moons#index")
    end

    it "routes to #new" do
      get("/moons/new").should route_to("moons#new")
    end

    it "routes to #show" do
      get("/moons/1").should route_to("moons#show", :id => "1")
    end

    it "routes to #edit" do
      get("/moons/1/edit").should route_to("moons#edit", :id => "1")
    end

    it "routes to #create" do
      post("/moons").should route_to("moons#create")
    end

    it "routes to #update" do
      put("/moons/1").should route_to("moons#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/moons/1").should route_to("moons#destroy", :id => "1")
    end

  end
end
