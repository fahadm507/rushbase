require 'rails_helper'

RSpec.describe "group_members/new", type: :view do
  before(:each) do
    assign(:group_member, GroupMember.new())
  end

  it "renders new group_member form" do
    render

    assert_select "form[action=?][method=?]", group_members_path, "post" do
    end
  end
end
