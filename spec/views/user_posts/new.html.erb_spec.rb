require 'rails_helper'

RSpec.describe "user_posts/new", type: :view do
  before(:each) do
    assign(:user_post, UserPost.new())
  end

  it "renders new user_post form" do
    render

    assert_select "form[action=?][method=?]", user_posts_path, "post" do
    end
  end
end
