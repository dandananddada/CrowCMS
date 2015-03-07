require 'rails_helper'

RSpec.describe "admin/product_options/edit", type: :view do
  before(:each) do
    @admin_product_option = assign(:admin_product_option, Admin::ProductOption.create!(
      :text => "MyString"
    ))
  end

  it "renders the edit admin_product_option form" do
    render

    assert_select "form[action=?][method=?]", admin_product_option_path(@admin_product_option), "post" do

      assert_select "input#admin_product_option_text[name=?]", "admin_product_option[text]"
    end
  end
end
