require 'rails_helper'

RSpec.describe "admin/pages/edit", type: :view do
  before(:each) do
    @admin_page = assign(:admin_page, Admin::Page.create!(
      :title => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit admin_page form" do
    render

    assert_select "form[action=?][method=?]", admin_page_path(@admin_page), "post" do

      assert_select "input#admin_page_title[name=?]", "admin_page[title]"

      assert_select "textarea#admin_page_content[name=?]", "admin_page[content]"
    end
  end
end
