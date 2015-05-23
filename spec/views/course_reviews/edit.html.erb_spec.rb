require 'rails_helper'

RSpec.describe "course_reviews/edit", type: :view do
  before(:each) do
    @course_review = assign(:course_review, CourseReview.create!(
      :title => "MyString",
      :description => "MyText",
      :user_id => 1,
      :course_id => 1
    ))
  end

  it "renders the edit course_review form" do
    render

    assert_select "form[action=?][method=?]", course_review_path(@course_review), "post" do

      assert_select "input#course_review_title[name=?]", "course_review[title]"

      assert_select "textarea#course_review_description[name=?]", "course_review[description]"

      assert_select "input#course_review_user_id[name=?]", "course_review[user_id]"

      assert_select "input#course_review_course_id[name=?]", "course_review[course_id]"
    end
  end
end
