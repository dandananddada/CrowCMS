(function(){var t;$(document).ready(function(){pageSetUp(),$("#validate-form").validate()}),$("#datatable_fixed_column thead input").keyup(function(){t.fnFilter(this.value,t.oApi._fnVisibleToColumnIndex(t.fnSettings(),$("thead input").index(this)))}),$("#datatable_fixed_column thead input").each(function(){this.initVal=this.value}),$("#datatable_fixed_column thead input").focus(function(){"search_init"===this.className&&(this.className="",this.value="")}),$("#datatable_fixed_column thead input").blur(function(){""===this.value&&(this.className="search_init",this.value=this.initVal)}),t=$("#datatable_fixed_column").dataTable({sDom:"<'dt-top-row'><'dt-wrapper't><'dt-row dt-bottom-row'<'row'<'col-sm-6'i><'col-sm-6 text-right'p>>",oLanguage:{sSearch:"Search all columns:",sProcessing:"\u6b63\u5728\u52a0\u8f7d\u4e2d......",sZeroRecords:"\u5bf9\u4e0d\u8d77\uff0c\u67e5\u8be2\u4e0d\u5230\u76f8\u5173\u6570\u636e\uff01",sEmptyTable:"\u8868\u4e2d\u65e0\u6570\u636e\u5b58\u5728\uff01",sInfo:"\u5f53\u524d\u663e\u793a _START_ \u5230 _END_ \u6761\uff0c\u5171 _TOTAL_ \u6761\u8bb0\u5f55",sInfoFiltered:"\u6570\u636e\u8868\u4e2d\u5171\u4e3a _MAX_ \u6761\u8bb0\u5f55",oPaginate:{sFirst:"\u9996\u9875",sPrevious:"\u4e0a\u4e00\u9875",sNext:"\u4e0b\u4e00\u9875",sLast:"\u672b\u9875"}},bSortCellsTop:!0})}).call(this);