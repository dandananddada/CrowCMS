$(document).ready ->
  pageSetUp()
  $('#validate-form').validate()
  $('.superbox').SuperBox()
  $("#container").masonry
    itemSelector: '.item'
  return
root = exports ? this
root.reload = ->
  location.reload() 
  return