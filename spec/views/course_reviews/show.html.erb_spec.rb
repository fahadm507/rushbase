require 'rails_helper'

RSpec.describe "course_reviews/show", type: :view do
  before(:each) do
    @course_review = assign(:course_review, CourseReview.create!(
      :title => "Title",
      :description => "MyText",
      :user_id => 1,
      :course_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
