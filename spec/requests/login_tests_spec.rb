require 'rails_helper'

RSpec.describe "LoginTests", type: :request do
  describe "GET /login_tests" do
    
    let!(:user) {
       create(:user, password: "admin1234")
    }

    it "correct login session" do
      visit new_user_session_path
      expect(page).to have_content("后台管理")
      fill_in 'user_password', with: "admin1234"
      page.find('.btn-primary').click
      expect(page).to have_content("首页"), "登陆失败"
    end

    it "error login session" do
      visit new_user_session_path
      expect(page).to have_content("后台管理")
      fill_in 'user_password', with: "admin"
      page.find('.btn-primary').click
      expect(page).to have_content("账号/密码错误，请重新输入")
    end

  end
end
