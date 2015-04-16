require 'rails_helper'

RSpec.describe "taken_courses/edit", type: :view do
  before(:each) do
    @taken_course = assign(:taken_course, TakenCourse.create!())
  end

  it "renders the edit taken_course form" do
    render

    assert_select "form[action=?][method=?]", taken_course_path(@taken_course), "post" do
    end
  end
end
