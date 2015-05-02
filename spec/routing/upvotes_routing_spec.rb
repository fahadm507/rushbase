require "rails_helper"

RSpec.describe UpvotesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/upvotes").to route_to("upvotes#index")
    end

    it "routes to #new" do
      expect(:get => "/upvotes/new").to route_to("upvotes#new")
    end

    it "routes to #show" do
      expect(:get => "/upvotes/1").to route_to("upvotes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/upvotes/1/edit").to route_to("upvotes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/upvotes").to route_to("upvotes#create")
    end

    it "routes to #update" do
      expect(:put => "/upvotes/1").to route_to("upvotes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/upvotes/1").to route_to("upvotes#destroy", :id => "1")
    end

  end
end
