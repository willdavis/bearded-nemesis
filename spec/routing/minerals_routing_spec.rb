require "spec_helper"

describe MineralsController do
  describe "routing" do

    it "routes to #index" do
      get("/minerals").should route_to("minerals#index")
    end

    it "routes to #new" do
      get("/minerals/new").should route_to("minerals#new")
    end

    it "routes to #show" do
      get("/minerals/1").should route_to("minerals#show", :id => "1")
    end

    it "routes to #edit" do
      get("/minerals/1/edit").should route_to("minerals#edit", :id => "1")
    end

    it "routes to #create" do
      post("/minerals").should route_to("minerals#create")
    end

    it "routes to #update" do
      put("/minerals/1").should route_to("minerals#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/minerals/1").should route_to("minerals#destroy", :id => "1")
    end

  end
end
