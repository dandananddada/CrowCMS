require 'rails_helper'

RSpec.describe "admin/menus/edit", type: :view do
  before(:each) do
    @admin_menu = assign(:admin_menu, Admin::Menu.create!(
      :name => "MyString",
      :url => "MyString"
    ))
  end

  it "renders the edit admin_menu form" do
    render

    assert_select "form[action=?][method=?]", admin_menu_path(@admin_menu), "post" do

      assert_select "input#admin_menu_name[name=?]", "admin_menu[name]"

      assert_select "input#admin_menu_url[name=?]", "admin_menu[url]"
    end
  end
end
