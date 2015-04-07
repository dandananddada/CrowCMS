# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# User.create(id: 1, email: 'admin@163.com', password: 'admin1234')

# Admin::Category.create(id: 1, title: '信息中心', is_article: false)
# Admin::Category.create(id: 2, ancestry: 1, title: '新闻', is_article: true, is_file: true, is_abstract: true )
# Admin::Category.create(id: 3, ancestry: 1, title: '公告', is_article: true, is_file: true, is_abstract: true )
# Admin::Category.create(id: 4, title: '产品中心', is_article: false)
# 
# 
Admin::Menu.create(id: 1, name: '企业介绍', url: '/about-us')
Admin::Menu.create(id: 2, name: '企业新闻', url: '/news')
Admin::Menu.create(id: 3, name: '企业公告', url: '/notices')
Admin::Menu.create(id: 4, name: '企业产品', url: '/products')
Admin::Menu.create(id: 5, name: '联系我们', url: '/contract-us')
# Admin::Page.create(id: 1, title: '公司介绍')
# Admin::Page.create(id: 2, title: '联系我们')

