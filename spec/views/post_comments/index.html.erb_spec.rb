require 'rails_helper'

RSpec.describe "post_comments/index", type: :view do
  before(:each) do
    assign(:post_comments, [
      PostComment.create!(),
      PostComment.create!()
    ])
  end

  it "renders a list of post_comments" do
    render
  end
end
