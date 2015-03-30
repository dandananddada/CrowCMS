require 'rails_helper'

RSpec.describe "admin/banners/edit", type: :view do
  before(:each) do
    @admin_banner = assign(:admin_banner, Admin::Banner.create!(
      :name => "MyString",
      :description => "MyText",
      :url => "MyString",
      :banner => ""
    ))
  end

  it "renders the edit admin_banner form" do
    render

    assert_select "form[action=?][method=?]", admin_banner_path(@admin_banner), "post" do

      assert_select "input#admin_banner_name[name=?]", "admin_banner[name]"

      assert_select "textarea#admin_banner_description[name=?]", "admin_banner[description]"

      assert_select "input#admin_banner_url[name=?]", "admin_banner[url]"

      assert_select "input#admin_banner_banner[name=?]", "admin_banner[banner]"
    end
  end
end
