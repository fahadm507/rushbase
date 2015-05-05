require 'rails_helper'

RSpec.describe "future_courses/new", type: :view do
  before(:each) do
    assign(:future_course, FutureCourse.new(
      :name => "MyString",
      :user_id => 1,
      :organization => 1
    ))
  end

  it "renders new future_course form" do
    render

    assert_select "form[action=?][method=?]", future_courses_path, "post" do

      assert_select "input#future_course_name[name=?]", "future_course[name]"

      assert_select "input#future_course_user_id[name=?]", "future_course[user_id]"

      assert_select "input#future_course_organization[name=?]", "future_course[organization]"
    end
  end
end
