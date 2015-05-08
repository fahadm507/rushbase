require 'rails_helper'

RSpec.describe "study_meetups/show", type: :view do
  before(:each) do
    @study_meetup = assign(:study_meetup, StudyMeetup.create!(
      :name => "Name",
      :description => "MyText",
      :user_id => 1,
      :goal => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
  end
end
