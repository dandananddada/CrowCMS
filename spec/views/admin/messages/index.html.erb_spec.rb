require 'rails_helper'

RSpec.describe "admin/messages/index", type: :view do
  before(:each) do
    assign(:admin_messages, [
      Admin::Message.create!(
        :author => "Author",
        :email => "Email",
        :content => "MyText",
        :is_permit => ""
      ),
      Admin::Message.create!(
        :author => "Author",
        :email => "Email",
        :content => "MyText",
        :is_permit => ""
      )
    ])
  end

  it "renders a list of admin/messages" do
    render
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
