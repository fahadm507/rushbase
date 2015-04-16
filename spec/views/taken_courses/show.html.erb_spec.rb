require 'rails_helper'

RSpec.describe "taken_courses/show", type: :view do
  before(:each) do
    @taken_course = assign(:taken_course, TakenCourse.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
