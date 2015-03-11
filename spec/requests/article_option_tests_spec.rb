require 'rails_helper'

RSpec.describe "ArticleOptionTests", type: :request do
  describe "GET /article_option_tests" do
  	 let!(:admin) {
  	 	@user = create(:user, password: "admin1234")
  	 	login_as @user, scope: :user
    }

    it "works! (now write some real specs)" do
       visit admin_article_options_path
       expect(page).to have_content("参数管理")
       click_link '添加'
       expect(page).to have_content("编辑参数")
       click_button '提交'
       expect(page).to have_content("编辑参数")
       fill_in 'admin_article_option_text', with: "测试参数"
       click_button '提交'
       expect(page).to have_content("测试参数")
       click_link '修改'
       expect(page).to have_content("编辑参数")
       expect(page).to have_selector("input[value='测试参数']")
       fill_in 'admin_article_option_text', with: "修改测试参数"
       click_button '提交'
       expect(page).to have_content("修改测试参数")
       click_link '删除'
       expect(page).not_to have_content("测试参数")
    end
  end
end
