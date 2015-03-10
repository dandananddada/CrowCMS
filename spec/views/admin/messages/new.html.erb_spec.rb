require 'rails_helper'

RSpec.describe "admin/messages/new", type: :view do
  before(:each) do
    assign(:admin_message, Admin::Message.new(
      :author => "MyString",
      :email => "MyString",
      :content => "MyText",
      :is_permit => ""
    ))
  end

  it "renders new admin_message form" do
    render

    assert_select "form[action=?][method=?]", admin_messages_path, "post" do

      assert_select "input#admin_message_author[name=?]", "admin_message[author]"

      assert_select "input#admin_message_email[name=?]", "admin_message[email]"

      assert_select "textarea#admin_message_content[name=?]", "admin_message[content]"

      assert_select "input#admin_message_is_permit[name=?]", "admin_message[is_permit]"
    end
  end
end
