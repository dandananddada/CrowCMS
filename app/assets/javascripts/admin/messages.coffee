# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  pageSetUp()
  $("#validate-form").validate()
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