require 'rails_helper'

RSpec.describe "upvotes/show", type: :view do
  before(:each) do
    @upvote = assign(:upvote, Upvote.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
