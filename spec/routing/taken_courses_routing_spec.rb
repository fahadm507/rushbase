require "rails_helper"

RSpec.describe TakenCoursesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/taken_courses").to route_to("taken_courses#index")
    end

    it "routes to #new" do
      expect(:get => "/taken_courses/new").to route_to("taken_courses#new")
    end

    it "routes to #show" do
      expect(:get => "/taken_courses/1").to route_to("taken_courses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/taken_courses/1/edit").to route_to("taken_courses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/taken_courses").to route_to("taken_courses#create")
    end

    it "routes to #update" do
      expect(:put => "/taken_courses/1").to route_to("taken_courses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/taken_courses/1").to route_to("taken_courses#destroy", :id => "1")
    end

  end
end
