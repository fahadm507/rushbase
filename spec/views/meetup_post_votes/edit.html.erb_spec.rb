require 'rails_helper'

RSpec.describe "meetup_post_votes/edit", type: :view do
  before(:each) do
    @meetup_post_vote = assign(:meetup_post_vote, MeetupPostVote.create!(
      :user_id => 1,
      :meetup_post_id => 1
    ))
  end

  it "renders the edit meetup_post_vote form" do
    render

    assert_select "form[action=?][method=?]", meetup_post_vote_path(@meetup_post_vote), "post" do

      assert_select "input#meetup_post_vote_user_id[name=?]", "meetup_post_vote[user_id]"

      assert_select "input#meetup_post_vote_meetup_post_id[name=?]", "meetup_post_vote[meetup_post_id]"
    end
  end
end
