require 'rails_helper'

RSpec.describe "admin/friend_links/edit", type: :view do
  before(:each) do
    @admin_friend_link = assign(:admin_friend_link, Admin::FriendLink.create!(
      :title => "MyString",
      :url => "MyString"
    ))
  end

  it "renders the edit admin_friend_link form" do
    render

    assert_select "form[action=?][method=?]", admin_friend_link_path(@admin_friend_link), "post" do

      assert_select "input#admin_friend_link_title[name=?]", "admin_friend_link[title]"

      assert_select "input#admin_friend_link_url[name=?]", "admin_friend_link[url]"
    end
  end
end
