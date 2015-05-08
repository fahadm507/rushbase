require 'rails_helper'

RSpec.describe "study_meetups/edit", type: :view do
  before(:each) do
    @study_meetup = assign(:study_meetup, StudyMeetup.create!(
      :name => "MyString",
      :description => "MyText",
      :user_id => 1,
      :goal => "MyText"
    ))
  end

  it "renders the edit study_meetup form" do
    render

    assert_select "form[action=?][method=?]", study_meetup_path(@study_meetup), "post" do

      assert_select "input#study_meetup_name[name=?]", "study_meetup[name]"

      assert_select "textarea#study_meetup_description[name=?]", "study_meetup[description]"

      assert_select "input#study_meetup_user_id[name=?]", "study_meetup[user_id]"

      assert_select "textarea#study_meetup_goal[name=?]", "study_meetup[goal]"
    end
  end
end
