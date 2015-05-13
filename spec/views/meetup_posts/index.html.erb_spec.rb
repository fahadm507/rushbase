require 'rails_helper'

RSpec.describe "meetup_posts/index", type: :view do
  before(:each) do
    assign(:meetup_posts, [
      MeetupPost.create!(
        :title => "Title",
        :description => "MyText",
        :meetup_id => "",
        :user_id => 1
      ),
      MeetupPost.create!(
        :title => "Title",
        :description => "MyText",
        :meetup_id => "",
        :user_id => 1
      )
    ])
  end

  it "renders a list of meetup_posts" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
