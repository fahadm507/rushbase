require 'rails_helper'

RSpec.describe "current_courses/index", type: :view do
  before(:each) do
    assign(:current_courses, [
      CurrentCourse.create!(),
      CurrentCourse.create!()
    ])
  end

  it "renders a list of current_courses" do
    render
  end
end
