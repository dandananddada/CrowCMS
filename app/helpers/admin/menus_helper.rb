module Admin::MenusHelper
	def nested_menu(admin_menus)
		content_tag :ul do
			admin_menus.each do |admin_menu|
				concat(content_tag(:li,admin_menu) do 
					concat(content_tag(:span,'admin_menu') do
						if admin_menu.has_children? 
							concat(content_tag(:i,'',class: "fa fa-lg fa-minus-circle"))
						else
							concat(content_tag(:i,'',class: "icon-leaf"))
						end
						concat(content_tag(:div, admin_menu.name, style: "display:inline; padding:12px"))
					end
					)
					concat(content_tag(:a,'',class: "pull-right", href: admin_menu_path(admin_menu.id), data: { method: "delete", title: t('menu.delete_title'), 
                       																													confirm: t('menu.delete_info') }) do
							content_tag(:div,'',class: "btn-label btn-danger", style: "border-radius:0px;//background-color:rgb(201,48,44)") do
								content_tag(:i,'',class: "glyphicon glyphicon-trash")
							end 
						end
						)
					concat(content_tag(:a,'',class: "pull-right", href: edit_admin_menu_path(admin_menu.id), data: { toggle: 'modal', target: '#myModal_'+admin_menu.id.to_s }) do
							content_tag(:div,'',class: "btn-label btn-warning", style: "border-radius:0px;//background-color:rgb(68,157,68)") do
								content_tag(:i,'',class: "glyphicon glyphicon-edit")
							end 
						end
						)

					concat(content_tag(:div,'', class: 'modal fade', id: 'myModal_'+admin_menu.id.to_s, tabindex: '-1', role: 'dialog',
										aria: {labelledby: 'myModal', hidden: true }) do
							concat("<div class='modal-dialog'>
										<div class='modal-content'>
										</div>
									</div>".html_safe)
						end
					)

					concat(content_tag(:a,'',class: "pull-right", href: new_admin_menu_path(admin_menu.id), data: { toggle: 'modal', target: '#myModal' }) do
							content_tag(:div,'',class: "btn-label btn-success", style: "border-radius:0px;//background-color:rgb(48,113,169)") do
								content_tag(:i,'',class: "glyphicon glyphicon-plus")
							end 
						end
						)
					if admin_menu.has_children? 
						concat(nested_menu(admin_menu.children))
					end
				end
				)
			end
		end
	end
end
