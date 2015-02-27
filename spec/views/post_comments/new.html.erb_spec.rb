require 'rails_helper'

RSpec.describe "post_comments/new", type: :view do
  before(:each) do
    assign(:post_comment, PostComment.new())
  end

  it "renders new post_comment form" do
    render

    assert_select "form[action=?][method=?]", post_comments_path, "post" do
    end
  end
end
