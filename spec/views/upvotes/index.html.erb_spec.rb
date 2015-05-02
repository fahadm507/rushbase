require 'rails_helper'

RSpec.describe "upvotes/index", type: :view do
  before(:each) do
    assign(:upvotes, [
      Upvote.create!(),
      Upvote.create!()
    ])
  end

  it "renders a list of upvotes" do
    render
  end
end
