require 'rails_helper'

RSpec.describe "user_posts/index", type: :view do
  before(:each) do
    assign(:user_posts, [
      UserPost.create!(),
      UserPost.create!()
    ])
  end

  it "renders a list of user_posts" do
    render
  end
end
