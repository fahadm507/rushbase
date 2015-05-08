require 'rails_helper'

RSpec.describe "StudyMeetupMembers", type: :request do
  describe "GET /study_meetup_members" do
    it "works! (now write some real specs)" do
      get study_meetup_members_path
      expect(response).to have_http_status(200)
    end
  end
end
