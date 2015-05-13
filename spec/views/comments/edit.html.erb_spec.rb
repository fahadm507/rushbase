require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      :description => "MyText",
      :meetup_post_id => "",
      :user_id => 1
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "textarea#comment_description[name=?]", "comment[description]"

      assert_select "input#comment_meetup_post_id[name=?]", "comment[meetup_post_id]"

      assert_select "input#comment_user_id[name=?]", "comment[user_id]"
    end
  end
end
