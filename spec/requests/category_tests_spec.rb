require 'rails_helper'

RSpec.describe "CategoryTests", type: :request do
  describe "is category flow will work" do
    let!(:admin) {
      @user = create(:user, password: "admin1234")
      login_as @user, scope: :user, :run_callbacks => false
    }

    it "is new link valid", js: true do
       visit admin_categories_path
       expect(page).to have_content("分栏管理")
       click_link '添加顶级分栏'
       expect(page).to have_content("编辑分栏")
       click_link '返回'
       expect(page).to have_content("分栏管理")
       click_link '添加顶级分栏'
       fill_in 'admin_category_title', with: "aaa"
       click_link '提交'
       expect(page).to have_content("分栏添加成功。")
    end

  end
end
