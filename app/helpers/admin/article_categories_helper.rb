module Admin::ArticleCategoriesHelper
	def nested_article_category(admin_article_categories)
		content_tag :ul do
			admin_article_categories.each do |admin_article_category|
				concat(content_tag(:li,admin_article_category) do 
					concat(content_tag(:span,'admin_article_category') do
						concat(content_tag(:i,'',class: "fa fa-lg fa-folder-open"))
						concat(content_tag(:div, admin_article_category.title, style: "display:inline; padding-left:12px"))
					end
					)
					concat(content_tag(:a,'',class: "pull-right", href: admin_article_category_path(admin_article_category.id), data: { method: "delete", confirm: "Are you sure"}) do
							content_tag(:div,'',class: "btn-label btn-danger", style: "border-radius:0px;//background-color:rgb(201,48,44)") do
								content_tag(:i,'',class: "glyphicon glyphicon-trash")
							end 
						end
						)
					concat(content_tag(:a,'',class: "pull-right", href: edit_admin_article_category_path(admin_article_category.id)) do
							content_tag(:div,'',class: "btn-label btn-warning", style: "border-radius:0px;//background-color:rgb(68,157,68)") do
								content_tag(:i,'',class: "glyphicon glyphicon-edit")
							end 
						end
						)
					concat(content_tag(:a,'',class: "pull-right", href: admin_article_category_path(admin_article_category.id)) do
							content_tag(:div,'',class: "btn-label btn-primary", style: "border-radius:0px;//background-color:rgb(48,113,169)") do
								content_tag(:i,'',class: "glyphicon glyphicon-eye-open")
							end 
						end
						)
					concat(content_tag(:a,'',class: "pull-right", href: new_admin_article_category_path(parent_id: admin_article_category.id)) do
							content_tag(:div,'',class: "btn-label btn-success", style: "border-radius:0px;//background-color:rgb(48,113,169)") do
								content_tag(:i,'',class: "glyphicon glyphicon-plus")
							end 
						end
						)
					if admin_article_category.has_children? 
						concat(nested_article_category(admin_article_category.children))
					end
				end
				)
			end
		end
	end
end
