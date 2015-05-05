require 'rails_helper'

RSpec.describe "future_courses/show", type: :view do
  before(:each) do
    @future_course = assign(:future_course, FutureCourse.create!(
      :name => "Name",
      :user_id => 1,
      :organization => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
