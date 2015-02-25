require 'rails_helper'

RSpec.describe "user_posts/edit", type: :view do
  before(:each) do
    @user_post = assign(:user_post, UserPost.create!())
  end

  it "renders the edit user_post form" do
    render

    assert_select "form[action=?][method=?]", user_post_path(@user_post), "post" do
    end
  end
end
