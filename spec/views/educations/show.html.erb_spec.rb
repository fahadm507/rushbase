require 'rails_helper'

RSpec.describe "educations/show", type: :view do
  before(:each) do
    @education = assign(:education, Education.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
