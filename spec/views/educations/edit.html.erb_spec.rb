require 'rails_helper'

RSpec.describe "educations/edit", type: :view do
  before(:each) do
    @education = assign(:education, Education.create!())
  end

  it "renders the edit education form" do
    render

    assert_select "form[action=?][method=?]", education_path(@education), "post" do
    end
  end
end
