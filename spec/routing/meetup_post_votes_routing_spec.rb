require "rails_helper"

RSpec.describe MeetupPostVotesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/meetup_post_votes").to route_to("meetup_post_votes#index")
    end

    it "routes to #new" do
      expect(:get => "/meetup_post_votes/new").to route_to("meetup_post_votes#new")
    end

    it "routes to #show" do
      expect(:get => "/meetup_post_votes/1").to route_to("meetup_post_votes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/meetup_post_votes/1/edit").to route_to("meetup_post_votes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/meetup_post_votes").to route_to("meetup_post_votes#create")
    end

    it "routes to #update" do
      expect(:put => "/meetup_post_votes/1").to route_to("meetup_post_votes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/meetup_post_votes/1").to route_to("meetup_post_votes#destroy", :id => "1")
    end

  end
end
