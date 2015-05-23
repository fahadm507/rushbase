require 'rails_helper'

RSpec.describe "course_reviews/new", type: :view do
  before(:each) do
    assign(:course_review, CourseReview.new(
      :title => "MyString",
      :description => "MyText",
      :user_id => 1,
      :course_id => 1
    ))
  end

  it "renders new course_review form" do
    render

    assert_select "form[action=?][method=?]", course_reviews_path, "post" do

      assert_select "input#course_review_title[name=?]", "course_review[title]"

      assert_select "textarea#course_review_description[name=?]", "course_review[description]"

      assert_select "input#course_review_user_id[name=?]", "course_review[user_id]"

      assert_select "input#course_review_course_id[name=?]", "course_review[course_id]"
    end
  end
end
