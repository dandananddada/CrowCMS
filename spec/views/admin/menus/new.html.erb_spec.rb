require 'rails_helper'

RSpec.describe "admin/menus/new", type: :view do
  before(:each) do
    assign(:admin_menu, Admin::Menu.new(
      :name => "MyString",
      :url => "MyString"
    ))
  end

  it "renders new admin_menu form" do
    render

    assert_select "form[action=?][method=?]", admin_menus_path, "post" do

      assert_select "input#admin_menu_name[name=?]", "admin_menu[name]"

      assert_select "input#admin_menu_url[name=?]", "admin_menu[url]"
    end
  end
end
