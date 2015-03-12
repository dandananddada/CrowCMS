require 'rails_helper'

RSpec.describe "PageTests", type: :request do
	describe "GET /page_tests" do
		let!(:admin) {
			@user = create(:user, password: "admin1234")
			login_as @user, scope: :user, :run_callbacks => false
		}

		it "safely workflow" do
			visit admin_pages_path
			expect(page).to have_content("文档管理")
			click_link '添加'
			expect(page).to have_content("编辑文档")
			fill_in 'admin_page_title', with: "测试文档标题"
			fill_in 'admin_page_abstract', with: "测试文档摘要"
			fill_in 'admin_page_content', with: "测试文档内容"
			click_button '提交'
			expect(page).to have_content("文档添加成功。")
			click_link '修改'
			expect(page).to have_selector("input[value='测试文档标题']")
			expect(page).to have_field('admin_page_abstract', with: '测试文档摘要')
			expect(page).to have_field('admin_page_content', with: '测试文档内容')
			fill_in 'admin_page_title', with: "修改测试文档标题"
			fill_in 'admin_page_abstract', with: "修改测试文档摘要"
			fill_in 'admin_page_content', with: "修改测试文档内容"
			click_button '提交'
			expect(page).to have_content("文档更新成功。")
			click_link '返回'
			click_link '删除'
			expect(page).to have_content("文档删除成功。")
		end
	end
end
