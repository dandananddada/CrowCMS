# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  pageSetUp()
  $('#validate-form').validate()
  if $("#is_option").is(':checked')
    $("#option_checkboxs").css("display","block")
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
  $("#is_option").change -> 
    if $("#is_option").is(':checked')
      $("#option_checkboxs").css("display","block")
    else
      $("#option_checkboxs").css("display","none")
  return
root = exports ? this
root.submit = ->
  str = ""
  $(".option-checbox").each -> 
    str += $(this).val()+"," if $(this).is(":checked")
  if $("#is_option").is(':checked')
    $("#option-ids").val(str.substring(0,str.length-1))
  else
    $("#option-ids").val("")
  if $("#is_option").is(':checked')&&$("#option-ids").val()==""
    $('#error_alert').css('display','block')
  else
    $('#error_alert').css('display','none')
    $("#validate-form").submit()
  return

