require 'rails_helper'

RSpec.describe "admin/product_options/new", type: :view do
  before(:each) do
    assign(:admin_product_option, Admin::ProductOption.new(
      :text => "MyString"
    ))
  end

  it "renders new admin_product_option form" do
    render

    assert_select "form[action=?][method=?]", admin_product_options_path, "post" do

      assert_select "input#admin_product_option_text[name=?]", "admin_product_option[text]"
    end
  end
end
