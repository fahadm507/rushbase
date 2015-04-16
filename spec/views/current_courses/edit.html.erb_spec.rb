require 'rails_helper'

RSpec.describe "current_courses/edit", type: :view do
  before(:each) do
    @current_course = assign(:current_course, CurrentCourse.create!())
  end

  it "renders the edit current_course form" do
    render

    assert_select "form[action=?][method=?]", current_course_path(@current_course), "post" do
    end
  end
end
