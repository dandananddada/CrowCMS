class HomeController < ApplicationController

	#render to specificy layout.
	layout 'home'

	#set conmmon variable for each views.
	before_filter :set_layout_variable
	
	def set_layout_variable
		@menus = Admin::Menu.all_by_order
		@banners = Admin::Banner.all
		@friend_links = Admin::Link.all
	end
	
end
