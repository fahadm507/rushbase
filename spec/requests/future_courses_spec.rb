require 'rails_helper'

RSpec.describe "FutureCourses", type: :request do
  describe "GET /future_courses" do
    it "works! (now write some real specs)" do
      get future_courses_path
      expect(response).to have_http_status(200)
    end
  end
end
