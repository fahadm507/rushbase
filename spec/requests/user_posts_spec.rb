require 'rails_helper'

RSpec.describe "UserPosts", type: :request do
  describe "GET /user_posts" do
    it "works! (now write some real specs)" do
      get user_posts_path
      expect(response).to have_http_status(200)
    end
  end
end
