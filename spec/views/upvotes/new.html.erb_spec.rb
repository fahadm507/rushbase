require 'rails_helper'

RSpec.describe "upvotes/new", type: :view do
  before(:each) do
    assign(:upvote, Upvote.new())
  end

  it "renders new upvote form" do
    render

    assert_select "form[action=?][method=?]", upvotes_path, "post" do
    end
  end
end
