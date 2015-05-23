require 'rails_helper'

RSpec.describe "CourseReviews", type: :request do
  describe "GET /course_reviews" do
    it "works! (now write some real specs)" do
      get course_reviews_path
      expect(response).to have_http_status(200)
    end
  end
end
