require 'rails_helper'

RSpec.describe "admin/messages/show", type: :view do
  before(:each) do
    @admin_message = assign(:admin_message, Admin::Message.create!(
      :author => "Author",
      :email => "Email",
      :content => "MyText",
      :is_permit => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
