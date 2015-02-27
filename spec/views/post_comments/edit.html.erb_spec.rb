require 'rails_helper'

RSpec.describe "post_comments/edit", type: :view do
  before(:each) do
    @post_comment = assign(:post_comment, PostComment.create!())
  end

  it "renders the edit post_comment form" do
    render

    assert_select "form[action=?][method=?]", post_comment_path(@post_comment), "post" do
    end
  end
end
