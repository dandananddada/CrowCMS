require 'rails_helper'

RSpec.describe "admin/friend_links/index", type: :view do
  before(:each) do
    assign(:admin_friend_links, [
      Admin::FriendLink.create!(
        :title => "Title",
        :url => "Url"
      ),
      Admin::FriendLink.create!(
        :title => "Title",
        :url => "Url"
      )
    ])
  end

  it "renders a list of admin/friend_links" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
