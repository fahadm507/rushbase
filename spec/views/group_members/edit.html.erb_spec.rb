require 'rails_helper'

RSpec.describe "group_members/edit", type: :view do
  before(:each) do
    @group_member = assign(:group_member, GroupMember.create!())
  end

  it "renders the edit group_member form" do
    render

    assert_select "form[action=?][method=?]", group_member_path(@group_member), "post" do
    end
  end
end
