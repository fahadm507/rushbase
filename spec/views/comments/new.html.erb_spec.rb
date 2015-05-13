require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    assign(:comment, Comment.new(
      :description => "MyText",
      :meetup_post_id => "",
      :user_id => 1
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do

      assert_select "textarea#comment_description[name=?]", "comment[description]"

      assert_select "input#comment_meetup_post_id[name=?]", "comment[meetup_post_id]"

      assert_select "input#comment_user_id[name=?]", "comment[user_id]"
    end
  end
end
