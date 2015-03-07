require 'rails_helper'

RSpec.describe "admin/pages/index", type: :view do
  before(:each) do
    assign(:admin_pages, [
      Admin::Page.create!(
        :title => "Title",
        :content => "MyText"
      ),
      Admin::Page.create!(
        :title => "Title",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of admin/pages" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
