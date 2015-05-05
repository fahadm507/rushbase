require 'rails_helper'

RSpec.describe "future_courses/index", type: :view do
  before(:each) do
    assign(:future_courses, [
      FutureCourse.create!(
        :name => "Name",
        :user_id => 1,
        :organization => 2
      ),
      FutureCourse.create!(
        :name => "Name",
        :user_id => 1,
        :organization => 2
      )
    ])
  end

  it "renders a list of future_courses" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
