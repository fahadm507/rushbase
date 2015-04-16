require 'rails_helper'

RSpec.describe "CurrentCourses", type: :request do
  describe "GET /current_courses" do
    it "works! (now write some real specs)" do
      get current_courses_path
      expect(response).to have_http_status(200)
    end
  end
end
