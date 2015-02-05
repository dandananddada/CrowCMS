  $.validator.messages.required = "该字段不能为空，请输入相关信息！"

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
    html = undefined
    message = undefined
    message = link.attr("data-confirm")
    $.SmartMessageBox
      title: "删除确认"
      content: "数据删除后将无法恢复，请谨慎操作！"
      buttons: "[否][是]"
    , (ButtonPressed) ->
      $.rails.confirmed link  if ButtonPressed is "是"