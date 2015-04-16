require "rails_helper"

RSpec.describe CurrentCoursesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/current_courses").to route_to("current_courses#index")
    end

    it "routes to #new" do
      expect(:get => "/current_courses/new").to route_to("current_courses#new")
    end

    it "routes to #show" do
      expect(:get => "/current_courses/1").to route_to("current_courses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/current_courses/1/edit").to route_to("current_courses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/current_courses").to route_to("current_courses#create")
    end

    it "routes to #update" do
      expect(:put => "/current_courses/1").to route_to("current_courses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/current_courses/1").to route_to("current_courses#destroy", :id => "1")
    end

  end
end
