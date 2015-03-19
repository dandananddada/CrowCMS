$(document).ready ->
  pageSetUp()
  $('#validate-form').validate()
  $('.superbox').SuperBox()
  # $('#validate-form').validate(
  # 	rules:
  # 		admin_album_name:
  # 			required: true
  # 	messages:
  # 		admin_album_name:
  # 			required: "Dddd"
  # 	)
  $("#container").masonry
    itemSelector: '.item'
  return
root = exports ? this
root.reload = ->
  location.reload() 
  return