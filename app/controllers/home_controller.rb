class HomeController < ApplicationController
	self.view_paths = ['app/views/', "/public/home/"]
	layout 'home'
end
