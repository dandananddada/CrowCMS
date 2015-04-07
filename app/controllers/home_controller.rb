class HomeController < ApplicationController
	layout 'home'

	before_filter :set_layout_variable
	
	def set_layout_variable
		@menus = Admin::Menu.all_by_order
		@banners = Admin::Banner.all
		@friend_links = Admin::FriendLink.all
	end
	
end
