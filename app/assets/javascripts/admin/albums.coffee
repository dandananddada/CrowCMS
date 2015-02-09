$(document).ready ->
  pageSetUp()
  $('.superbox').SuperBox()
  $("#container").masonry
    itemSelector: '.item'
  return
root = exports ? this
root.reload = ->
  location.reload() 
  return