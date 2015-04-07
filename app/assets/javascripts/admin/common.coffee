  $.validator.messages.required = "该字段不能为空，请输入相关信息！"
  $.validator.messages.url = "请输入合法的URL（以http://开始）！"
  
  $.rails.allowAction = (link) ->
    return true  unless link.attr("data-confirm")
    $.rails.showConfirmDialog link
    false

  $.rails.confirmed = (link) ->
    link.removeAttr "data-confirm"
    link.trigger "click.rails"

  $.rails.showConfirmDialog = (link) ->
    html = undefined
    message = undefined
    title = undefined
    title = link.attr("data-title")
    message = link.attr("data-confirm")
    $.SmartMessageBox
      title: title
      content: message
      buttons: "[否][是]"
    , (ButtonPressed) ->
      $.rails.confirmed link  if ButtonPressed is "是"