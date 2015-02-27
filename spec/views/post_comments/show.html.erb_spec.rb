require 'rails_helper'

RSpec.describe "post_comments/show", type: :view do
  before(:each) do
    @post_comment = assign(:post_comment, PostComment.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
