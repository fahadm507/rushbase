require "rails_helper"

RSpec.describe StudyMeetupMembersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/study_meetup_members").to route_to("study_meetup_members#index")
    end

    it "routes to #new" do
      expect(:get => "/study_meetup_members/new").to route_to("study_meetup_members#new")
    end

    it "routes to #show" do
      expect(:get => "/study_meetup_members/1").to route_to("study_meetup_members#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/study_meetup_members/1/edit").to route_to("study_meetup_members#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/study_meetup_members").to route_to("study_meetup_members#create")
    end

    it "routes to #update" do
      expect(:put => "/study_meetup_members/1").to route_to("study_meetup_members#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/study_meetup_members/1").to route_to("study_meetup_members#destroy", :id => "1")
    end

  end
end
