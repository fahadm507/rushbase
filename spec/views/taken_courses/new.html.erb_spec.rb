require 'rails_helper'

RSpec.describe "taken_courses/new", type: :view do
  before(:each) do
    assign(:taken_course, TakenCourse.new())
  end

  it "renders new taken_course form" do
    render

    assert_select "form[action=?][method=?]", taken_courses_path, "post" do
    end
  end
end
