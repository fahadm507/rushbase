require 'rails_helper'

RSpec.describe "upvotes/edit", type: :view do
  before(:each) do
    @upvote = assign(:upvote, Upvote.create!())
  end

  it "renders the edit upvote form" do
    render

    assert_select "form[action=?][method=?]", upvote_path(@upvote), "post" do
    end
  end
end
