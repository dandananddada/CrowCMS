class Api::LayoutsController < ApplicationController

	api! "get site menus"
	example "
	[{
		ancestry: null,
		id: 21,
		name: 'HOME',
		url: '/test',
		weight: 1,
		visible: true,
		children: [ ]
	},{
		ancestry: null,
		id: 2,
		name: 'NEWS',
		url: '/news',
		weight: 2,
		visible: true,
		children: [ ]
	},{ ... 
	}]"
	def menus
		@menus = Admin::Menu.all_by_order.arrange_serializable(order: :weight)
		render json: @menus 
	end

	api :GET, "/firend-link", "get friend links"
	example "
	[{
		ancestry: null,
		id: 21,
		name: 'HOME',
		url: '/test',
		weight: 1,
		visible: true,
		children: [ ]
	},{
		ancestry: null,
		id: 2,
		name: 'NEWS',
		url: '/news',
		weight: 2,
		visible: true,
		children: [ ]
	},{ ... 
	}]"
	def friend_links
		@firend_links = Admin::FriendLink.all
		render json: @firend_links
	end
end
