require 'rails_helper'

RSpec.describe "admin/banners/show", type: :view do
  before(:each) do
    @admin_banner = assign(:admin_banner, Admin::Banner.create!(
      :name => "Name",
      :description => "MyText",
      :url => "Url",
      :banner => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(//)
  end
end
