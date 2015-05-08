require 'rails_helper'

RSpec.describe "study_meetups/index", type: :view do
  before(:each) do
    assign(:study_meetups, [
      StudyMeetup.create!(
        :name => "Name",
        :description => "MyText",
        :user_id => 1,
        :goal => "MyText"
      ),
      StudyMeetup.create!(
        :name => "Name",
        :description => "MyText",
        :user_id => 1,
        :goal => "MyText"
      )
    ])
  end

  it "renders a list of study_meetups" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
