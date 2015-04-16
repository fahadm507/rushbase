require 'rails_helper'

RSpec.describe "current_courses/show", type: :view do
  before(:each) do
    @current_course = assign(:current_course, CurrentCourse.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
