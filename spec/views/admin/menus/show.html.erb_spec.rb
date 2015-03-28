require 'rails_helper'

RSpec.describe "admin/menus/show", type: :view do
  before(:each) do
    @admin_menu = assign(:admin_menu, Admin::Menu.create!(
      :name => "Name",
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Url/)
  end
end
