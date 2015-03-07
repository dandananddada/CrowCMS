require 'rails_helper'

RSpec.describe "admin/pages/new", type: :view do
  before(:each) do
    assign(:admin_page, Admin::Page.new(
      :title => "MyString",
      :content => "MyText"
    ))
  end

  it "renders new admin_page form" do
    render

    assert_select "form[action=?][method=?]", admin_pages_path, "post" do

      assert_select "input#admin_page_title[name=?]", "admin_page[title]"

      assert_select "textarea#admin_page_content[name=?]", "admin_page[content]"
    end
  end
end
