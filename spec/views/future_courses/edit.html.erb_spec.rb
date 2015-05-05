require 'rails_helper'

RSpec.describe "future_courses/edit", type: :view do
  before(:each) do
    @future_course = assign(:future_course, FutureCourse.create!(
      :name => "MyString",
      :user_id => 1,
      :organization => 1
    ))
  end

  it "renders the edit future_course form" do
    render

    assert_select "form[action=?][method=?]", future_course_path(@future_course), "post" do

      assert_select "input#future_course_name[name=?]", "future_course[name]"

      assert_select "input#future_course_user_id[name=?]", "future_course[user_id]"

      assert_select "input#future_course_organization[name=?]", "future_course[organization]"
    end
  end
end
