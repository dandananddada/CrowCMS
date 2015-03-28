require 'rails_helper'

RSpec.describe "admin/menus/index", type: :view do
  before(:each) do
    assign(:admin_menus, [
      Admin::Menu.create!(
        :name => "Name",
        :url => "Url"
      ),
      Admin::Menu.create!(
        :name => "Name",
        :url => "Url"
      )
    ])
  end

  it "renders a list of admin/menus" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
