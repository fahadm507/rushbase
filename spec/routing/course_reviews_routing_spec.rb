require "rails_helper"

RSpec.describe CourseReviewsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/course_reviews").to route_to("course_reviews#index")
    end

    it "routes to #new" do
      expect(:get => "/course_reviews/new").to route_to("course_reviews#new")
    end

    it "routes to #show" do
      expect(:get => "/course_reviews/1").to route_to("course_reviews#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/course_reviews/1/edit").to route_to("course_reviews#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/course_reviews").to route_to("course_reviews#create")
    end

    it "routes to #update" do
      expect(:put => "/course_reviews/1").to route_to("course_reviews#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/course_reviews/1").to route_to("course_reviews#destroy", :id => "1")
    end

  end
end
