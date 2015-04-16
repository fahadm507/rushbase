require 'rails_helper'

RSpec.describe "educations/new", type: :view do
  before(:each) do
    assign(:education, Education.new())
  end

  it "renders new education form" do
    render

    assert_select "form[action=?][method=?]", educations_path, "post" do
    end
  end
end
