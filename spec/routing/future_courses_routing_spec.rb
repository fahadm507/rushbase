require "rails_helper"

RSpec.describe FutureCoursesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/future_courses").to route_to("future_courses#index")
    end

    it "routes to #new" do
      expect(:get => "/future_courses/new").to route_to("future_courses#new")
    end

    it "routes to #show" do
      expect(:get => "/future_courses/1").to route_to("future_courses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/future_courses/1/edit").to route_to("future_courses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/future_courses").to route_to("future_courses#create")
    end

    it "routes to #update" do
      expect(:put => "/future_courses/1").to route_to("future_courses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/future_courses/1").to route_to("future_courses#destroy", :id => "1")
    end

  end
end
