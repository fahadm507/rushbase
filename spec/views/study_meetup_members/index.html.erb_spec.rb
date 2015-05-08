require 'rails_helper'

RSpec.describe "study_meetup_members/index", type: :view do
  before(:each) do
    assign(:study_meetup_members, [
      StudyMeetupMember.create!(
        :user_id => 1,
        :study_meetup_id => 2
      ),
      StudyMeetupMember.create!(
        :user_id => 1,
        :study_meetup_id => 2
      )
    ])
  end

  it "renders a list of study_meetup_members" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
