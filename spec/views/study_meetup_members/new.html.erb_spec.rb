require 'rails_helper'

RSpec.describe "study_meetup_members/new", type: :view do
  before(:each) do
    assign(:study_meetup_member, StudyMeetupMember.new(
      :user_id => 1,
      :study_meetup_id => 1
    ))
  end

  it "renders new study_meetup_member form" do
    render

    assert_select "form[action=?][method=?]", study_meetup_members_path, "post" do

      assert_select "input#study_meetup_member_user_id[name=?]", "study_meetup_member[user_id]"

      assert_select "input#study_meetup_member_study_meetup_id[name=?]", "study_meetup_member[study_meetup_id]"
    end
  end
end
