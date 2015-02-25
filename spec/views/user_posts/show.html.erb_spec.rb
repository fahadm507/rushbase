require 'rails_helper'

RSpec.describe "user_posts/show", type: :view do
  before(:each) do
    @user_post = assign(:user_post, UserPost.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
