require 'rails_helper'

RSpec.describe "educations/index", type: :view do
  before(:each) do
    assign(:educations, [
      Education.create!(),
      Education.create!()
    ])
  end

  it "renders a list of educations" do
    render
  end
end
