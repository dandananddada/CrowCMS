# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  pageSetUp()
  $('#validate-form').validate()
  return
  
$("#datatable_fixed_column thead input").keyup ->
  oTable.fnFilter @value, oTable.oApi._fnVisibleToColumnIndex(oTable.fnSettings(), $("thead input").index(this))
  return
$("#datatable_fixed_column thead input").change ->
  oTable.fnFilter @value, oTable.oApi._fnVisibleToColumnIndex(oTable.fnSettings(), $("thead input").index(this))
  return 
$("#datatable_fixed_column thead select").change ->
  oTable.fnFilter @value, oTable.oApi._fnVisibleToColumnIndex(oTable.fnSettings(), $("thead input").index(this))
  return

$("#datatable_fixed_column thead input").each (i) ->
  @initVal = @value
  return

$("#datatable_fixed_column thead input").focus ->
  if @className is "search_init"
    @className = ""
    @value = ""
  return

$("#datatable_fixed_column thead input").blur (i) ->
  if @value is ""
    @className = "search_init"
    @value = @initVal
  return

oTable = $("#datatable_fixed_column").dataTable(
  sDom: "<'dt-top-row'><'dt-wrapper't><'dt-row dt-bottom-row'<'row'<'col-sm-6'i><'col-sm-6 text-right'p>>"
  
  oLanguage:
    sSearch: "Search all columns:"
    sProcessing: "正在加载中......"
    sZeroRecords: "对不起，查询不到相关数据！"
    sEmptyTable: "表中无数据存在！"
    sInfo: "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录"
    sInfoFiltered: "数据表中共为 _MAX_ 条记录"
    oPaginate:
      sFirst: '首页'
      sPrevious: '上一页'
      sNext: '下一页'
      sLast: '末页'

  bSortCellsTop: true
)

$("#spinner").spinner
  min: 0
  max: 2500
  step: 5
  start: 0
  numberFormat: "C"

$("#article-category").change ->
  $.ajax
    url: "/admin/article/concat"
    data:
      id: $("#article-category").val()

    success: (data) ->
      if data.is_option is true
        $("#option_panel").show()
        array = new Array()
        array = data.option_keys.split(',')
        $("#option_items").empty()
        for a in array
          $("#option_items").append "<div class='row'><section class='col col-5'><label for='"+a+"' class='label' >"+a+"</label><label class='input'><i class='icon-append fa fa-cogs'></i><input type='text' name='"+a+"' value='' /></label></section></div>"
        $("#is_option").show()
      else
        $("#option_panel").hide()
      if data.is_file is false and data.is_thumb is false and data.is_abstract is false
          $("#extra_panel").hide()
      else
        $("#extra_panel").show()
        if data.is_thumb is false
          $("#is_thumb").hide()
        else
          $("#is_thumb").show()
        if data.is_file is false
          $("#is_file").hide()
        else
          $("#is_file").show()
        if data.is_abstract is false
          $("#is_abstract").hide()
        else
          $("#is_abstract").show()
root = exports ? this
root.submit = ->
  str = ""
  $("#option_items .row .col .input input").each ->
    str+= "\:"+this.name+"=>\""+this.value+"\","
  $("#options").val("{"+str.substring(0,str.length-1)+"}")
  $("#validate-form").submit()
  return
root.mutiDestroy = ->
  $.SmartMessageBox(
      title:'您确认要删除全部选中文章？',
      content:'您确认要删除全部选中文章？',
      buttons : '[否][是]',
      (ButtonPressed) ->
        if ButtonPressed == "是"
          $("#muti_destory_form").submit()
  )
 

