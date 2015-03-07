require 'rails_helper'

RSpec.describe "admin/pages/show", type: :view do
  before(:each) do
    @admin_page = assign(:admin_page, Admin::Page.create!(
      :title => "Title",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
