require 'rails_helper'

RSpec.describe "admin/friend_links/new", type: :view do
  before(:each) do
    assign(:admin_friend_link, Admin::FriendLink.new(
      :title => "MyString",
      :url => "MyString"
    ))
  end

  it "renders new admin_friend_link form" do
    render

    assert_select "form[action=?][method=?]", admin_friend_links_path, "post" do

      assert_select "input#admin_friend_link_title[name=?]", "admin_friend_link[title]"

      assert_select "input#admin_friend_link_url[name=?]", "admin_friend_link[url]"
    end
  end
end
