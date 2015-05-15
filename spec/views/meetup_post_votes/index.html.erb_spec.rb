require 'rails_helper'

RSpec.describe "meetup_post_votes/index", type: :view do
  before(:each) do
    assign(:meetup_post_votes, [
      MeetupPostVote.create!(
        :user_id => 1,
        :meetup_post_id => 2
      ),
      MeetupPostVote.create!(
        :user_id => 1,
        :meetup_post_id => 2
      )
    ])
  end

  it "renders a list of meetup_post_votes" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
