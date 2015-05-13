require 'rails_helper'

RSpec.describe "meetup_posts/show", type: :view do
  before(:each) do
    @meetup_post = assign(:meetup_post, MeetupPost.create!(
      :title => "Title",
      :description => "MyText",
      :meetup_id => "",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
  end
end
