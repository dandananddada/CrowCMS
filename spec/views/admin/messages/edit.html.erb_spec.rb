require 'rails_helper'

RSpec.describe "admin/messages/edit", type: :view do
  before(:each) do
    @admin_message = assign(:admin_message, Admin::Message.create!(
      :author => "MyString",
      :email => "MyString",
      :content => "MyText",
      :is_permit => ""
    ))
  end

  it "renders the edit admin_message form" do
    render

    assert_select "form[action=?][method=?]", admin_message_path(@admin_message), "post" do

      assert_select "input#admin_message_author[name=?]", "admin_message[author]"

      assert_select "input#admin_message_email[name=?]", "admin_message[email]"

      assert_select "textarea#admin_message_content[name=?]", "admin_message[content]"

      assert_select "input#admin_message_is_permit[name=?]", "admin_message[is_permit]"
    end
  end
end
