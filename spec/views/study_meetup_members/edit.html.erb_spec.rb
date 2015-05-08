require 'rails_helper'

RSpec.describe "study_meetup_members/edit", type: :view do
  before(:each) do
    @study_meetup_member = assign(:study_meetup_member, StudyMeetupMember.create!(
      :user_id => 1,
      :study_meetup_id => 1
    ))
  end

  it "renders the edit study_meetup_member form" do
    render

    assert_select "form[action=?][method=?]", study_meetup_member_path(@study_meetup_member), "post" do

      assert_select "input#study_meetup_member_user_id[name=?]", "study_meetup_member[user_id]"

      assert_select "input#study_meetup_member_study_meetup_id[name=?]", "study_meetup_member[study_meetup_id]"
    end
  end
end
