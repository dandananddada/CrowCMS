$(document).ready ->
  pageSetUp()
  $('.superbox').SuperBox()
  $("#container").masonry
    itemSelector: '.item'
  return
  # $("#test").change ->
  #   selections = JSON.stringify($(test).select2('data'))
  #   for 
  #   console.log 'Selected options: ' + selections
  #   console.info $(test).select2('data')[0].text
  #   $('#selectedText').text selections
  #   return
