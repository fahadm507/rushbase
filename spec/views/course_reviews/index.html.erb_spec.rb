require 'rails_helper'

RSpec.describe "course_reviews/index", type: :view do
  before(:each) do
    assign(:course_reviews, [
      CourseReview.create!(
        :title => "Title",
        :description => "MyText",
        :user_id => 1,
        :course_id => 2
      ),
      CourseReview.create!(
        :title => "Title",
        :description => "MyText",
        :user_id => 1,
        :course_id => 2
      )
    ])
  end

  it "renders a list of course_reviews" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
