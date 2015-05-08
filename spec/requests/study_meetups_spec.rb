require 'rails_helper'

RSpec.describe "StudyMeetups", type: :request do
  describe "GET /study_meetups" do
    it "works! (now write some real specs)" do
      get study_meetups_path
      expect(response).to have_http_status(200)
    end
  end
end
