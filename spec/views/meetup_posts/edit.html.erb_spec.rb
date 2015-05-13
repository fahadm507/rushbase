require 'rails_helper'

RSpec.describe "meetup_posts/edit", type: :view do
  before(:each) do
    @meetup_post = assign(:meetup_post, MeetupPost.create!(
      :title => "MyString",
      :description => "MyText",
      :meetup_id => "",
      :user_id => 1
    ))
  end

  it "renders the edit meetup_post form" do
    render

    assert_select "form[action=?][method=?]", meetup_post_path(@meetup_post), "post" do

      assert_select "input#meetup_post_title[name=?]", "meetup_post[title]"

      assert_select "textarea#meetup_post_description[name=?]", "meetup_post[description]"

      assert_select "input#meetup_post_meetup_id[name=?]", "meetup_post[meetup_id]"

      assert_select "input#meetup_post_user_id[name=?]", "meetup_post[user_id]"
    end
  end
end
