module Admin::ArticleCategoriesHelper
	def nested_category(admin_categories)
		content_tag :ul do
			admin_categories.each do |admin_category|
				concat(content_tag(:li,admin_category) do 
					concat(content_tag(:span,'admin_category') do
						if admin_category.has_children? 
							concat(content_tag(:i,'',class: "fa fa-lg fa-minus-circle"))
						else
							concat(content_tag(:i,'',class: "icon-leaf"))
						end
						concat(content_tag(:div, admin_category.title, style: "display:inline; padding:12px"))
					end
					)
					concat(content_tag(:a,'',class: "pull-right", href: admin_category_path(admin_category.id), data: { method: "delete", title: t('category.delete_title'), 
                       																													confirm: t('category.delete_info') }) do
							content_tag(:div,'',class: "btn-label btn-danger", style: "border-radius:0px;//background-color:rgb(201,48,44)") do
								content_tag(:i,'',class: "glyphicon glyphicon-trash")
							end 
						end
						)
					concat(content_tag(:a,'',class: "pull-right", href: edit_admin_category_path(admin_category.id)) do
							content_tag(:div,'',class: "btn-label btn-warning", style: "border-radius:0px;//background-color:rgb(68,157,68)") do
								content_tag(:i,'',class: "glyphicon glyphicon-edit")
							end 
						end
						)
					concat(content_tag(:a,'',class: "pull-right", href: admin_category_path(admin_category.id)) do
							content_tag(:div,'',class: "btn-label btn-primary", style: "border-radius:0px;//background-color:rgb(48,113,169)") do
								content_tag(:i,'',class: "glyphicon glyphicon-eye-open")
							end 
						end
						)
					concat(content_tag(:a,'',class: "pull-right", href: new_admin_category_path(admin_category.id)) do
							content_tag(:div,'',class: "btn-label btn-success", style: "border-radius:0px;//background-color:rgb(48,113,169)") do
								content_tag(:i,'',class: "glyphicon glyphicon-plus")
							end 
						end
						)
					if admin_category.has_children? 
						concat(nested_category(admin_category.children))
					end
				end
				)
			end
		end
	end

	def article_option(options)
		options.each do |option|
			content_tag(:p,'option')
		end
	end

end
