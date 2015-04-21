require "rails_helper"

RSpec.describe AtriclesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/atricles").to route_to("atricles#index")
    end

    it "routes to #new" do
      expect(:get => "/atricles/new").to route_to("atricles#new")
    end

    it "routes to #show" do
      expect(:get => "/atricles/1").to route_to("atricles#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/atricles/1/edit").to route_to("atricles#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/atricles").to route_to("atricles#create")
    end

    it "routes to #update" do
      expect(:put => "/atricles/1").to route_to("atricles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/atricles/1").to route_to("atricles#destroy", :id => "1")
    end

  end
end
