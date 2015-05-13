require "rails_helper"

RSpec.describe MeetupPostsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/meetup_posts").to route_to("meetup_posts#index")
    end

    it "routes to #new" do
      expect(:get => "/meetup_posts/new").to route_to("meetup_posts#new")
    end

    it "routes to #show" do
      expect(:get => "/meetup_posts/1").to route_to("meetup_posts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/meetup_posts/1/edit").to route_to("meetup_posts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/meetup_posts").to route_to("meetup_posts#create")
    end

    it "routes to #update" do
      expect(:put => "/meetup_posts/1").to route_to("meetup_posts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/meetup_posts/1").to route_to("meetup_posts#destroy", :id => "1")
    end

  end
end
