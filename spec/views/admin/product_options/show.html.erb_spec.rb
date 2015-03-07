require 'rails_helper'

RSpec.describe "admin/product_options/show", type: :view do
  before(:each) do
    @admin_product_option = assign(:admin_product_option, Admin::ProductOption.create!(
      :text => "Text"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Text/)
  end
end
