require 'rails_helper'

RSpec.describe "meetup_post_votes/show", type: :view do
  before(:each) do
    @meetup_post_vote = assign(:meetup_post_vote, MeetupPostVote.create!(
      :user_id => 1,
      :meetup_post_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
