require 'rails_helper'

RSpec.describe "TakenCourses", type: :request do
  describe "GET /taken_courses" do
    it "works! (now write some real specs)" do
      get taken_courses_path
      expect(response).to have_http_status(200)
    end
  end
end
