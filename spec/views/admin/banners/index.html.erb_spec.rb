require 'rails_helper'

RSpec.describe "admin/banners/index", type: :view do
  before(:each) do
    assign(:admin_banners, [
      Admin::Banner.create!(
        :name => "Name",
        :description => "MyText",
        :url => "Url",
        :banner => ""
      ),
      Admin::Banner.create!(
        :name => "Name",
        :description => "MyText",
        :url => "Url",
        :banner => ""
      )
    ])
  end

  it "renders a list of admin/banners" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
