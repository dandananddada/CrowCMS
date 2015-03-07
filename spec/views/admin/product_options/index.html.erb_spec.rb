require 'rails_helper'

RSpec.describe "admin/product_options/index", type: :view do
  before(:each) do
    assign(:admin_product_options, [
      Admin::ProductOption.create!(
        :text => "Text"
      ),
      Admin::ProductOption.create!(
        :text => "Text"
      )
    ])
  end

  it "renders a list of admin/product_options" do
    render
    assert_select "tr>td", :text => "Text".to_s, :count => 2
  end
end
