require 'rails_helper'

RSpec.describe "current_courses/new", type: :view do
  before(:each) do
    assign(:current_course, CurrentCourse.new())
  end

  it "renders new current_course form" do
    render

    assert_select "form[action=?][method=?]", current_courses_path, "post" do
    end
  end
end
