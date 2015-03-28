require 'rails_helper'

RSpec.describe "admin/friend_links/show", type: :view do
  before(:each) do
    @admin_friend_link = assign(:admin_friend_link, Admin::FriendLink.create!(
      :title => "Title",
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Url/)
  end
end
