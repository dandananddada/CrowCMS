# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  pageSetUp()
  $('.tree > ul').attr('role', 'tree').find('ul').attr 'role', 'group'
  $('.tree').find('li:has(ul)').addClass('parent_li').attr('role', 'treeitem').find(' > span').attr('title', 'Collapse this branch').on 'click', (e) ->
    children = $(this).parent('li.parent_li').find(' > ul > li')
    if children.is(':visible')
      children.hide 'fast'
      $(this).attr('title', 'Expand this branch').find(' > i').removeClass().addClass 'fa fa-lg fa-plus-circle'
    else
      children.show 'fast'
      $(this).attr('title', 'Collapse this branch').find(' > i').removeClass().addClass 'fa fa-lg fa-minus-circle'
    e.stopPropagation()
    return