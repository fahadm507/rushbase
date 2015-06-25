require 'rails_helper'

RSpec.describe "group_members/index", type: :view do
  before(:each) do
    assign(:group_members, [
      GroupMember.create!(),
      GroupMember.create!()
    ])
  end

  it "renders a list of group_members" do
    render
  end
end
