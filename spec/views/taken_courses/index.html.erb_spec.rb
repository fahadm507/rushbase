require 'rails_helper'

RSpec.describe "taken_courses/index", type: :view do
  before(:each) do
    assign(:taken_courses, [
      TakenCourse.create!(),
      TakenCourse.create!()
    ])
  end

  it "renders a list of taken_courses" do
    render
  end
end
