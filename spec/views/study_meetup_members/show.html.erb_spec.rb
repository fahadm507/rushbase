require 'rails_helper'

RSpec.describe "study_meetup_members/show", type: :view do
  before(:each) do
    @study_meetup_member = assign(:study_meetup_member, StudyMeetupMember.create!(
      :user_id => 1,
      :study_meetup_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
