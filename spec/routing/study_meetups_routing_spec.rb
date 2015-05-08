require "rails_helper"

RSpec.describe StudyMeetupsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/study_meetups").to route_to("study_meetups#index")
    end

    it "routes to #new" do
      expect(:get => "/study_meetups/new").to route_to("study_meetups#new")
    end

    it "routes to #show" do
      expect(:get => "/study_meetups/1").to route_to("study_meetups#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/study_meetups/1/edit").to route_to("study_meetups#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/study_meetups").to route_to("study_meetups#create")
    end

    it "routes to #update" do
      expect(:put => "/study_meetups/1").to route_to("study_meetups#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/study_meetups/1").to route_to("study_meetups#destroy", :id => "1")
    end

  end
end
