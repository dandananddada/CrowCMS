!function(e,t,i,a){function l(t,i){this.obj=e(t),this.o=e.extend({},e.fn[o].defaults,i),this.objId=this.obj.attr("id"),this.pwCtrls=".jarviswidget-ctrls",this.widget=this.obj.find(this.o.widgets),this.toggleClass=this.o.toggleClass.split("|"),this.editClass=this.o.editClass.split("|"),this.fullscreenClass=this.o.fullscreenClass.split("|"),this.customClass=this.o.customClass.split("|"),this.init()}var o="jarvisWidgets";l.prototype={_settings:function(){var e=this;storage=!!function(){var e,t=+new Date;try{return localStorage.setItem(t,t),e=localStorage.getItem(t)==t,localStorage.removeItem(t),e}catch(i){}}()&&localStorage,storage&&e.o.localStorage&&(e.o.ajaxnav===!0?(widget_url=location.hash.replace(/^#/,""),keySettings="Plugin_settings_"+widget_url+"_"+e.objId,getKeySettings=localStorage.getItem(keySettings),keyPosition="Plugin_position_"+widget_url+"_"+e.objId,getKeyPosition=localStorage.getItem(keyPosition)):(keySettings="jarvisWidgets_settings_"+location.pathname+"_"+e.objId,getKeySettings=localStorage.getItem(keySettings),keyPosition="jarvisWidgets_position_"+location.pathname+"_"+e.objId,getKeyPosition=localStorage.getItem(keyPosition))),clickEvent="ontouchstart"in t||t.DocumentTouch&&i instanceof DocumentTouch?"touchstart":"click"},_runLoaderWidget:function(e){var t=this;t.o.indicator===!0&&e.parents(t.o.widgets).find(".jarviswidget-loader").stop(!0,!0).fadeIn(100).delay(t.o.indicatorTime).fadeOut(100)},_getPastTimestamp:function(e){var t=this,i=new Date(e);if(a=i.getMonth()+1,l=i.getDate(),tsYear=i.getFullYear(),o=i.getHours(),s=i.getMinutes(),n=i.getUTCSeconds(),10>a)var a="0"+a;if(10>l)var l="0"+l;if(10>o)var o="0"+o;if(10>s)var s="0"+s;if(10>n)var n="0"+n;var r=t.o.timestampFormat.replace(/%d%/g,l).replace(/%m%/g,a).replace(/%y%/g,tsYear).replace(/%h%/g,o).replace(/%i%/g,s).replace(/%s%/g,n);return r},_loadAjaxFile:function(t,i,a){var l=this;t.find(".widget-body").load(i,function(i,a,o){var s=e(this);if("error"==a&&s.html('<h4 class="alert alert-danger">'+l.o.labelError+"<b> "+o.status+" "+o.statusText+"</b></h4>"),"success"==a){var n=t.find(l.o.timestampPlaceholder);n.length&&n.html(l._getPastTimestamp(new Date)),"function"==typeof l.o.afterLoad&&l.o.afterLoad.call(this,t)}}),l._runLoaderWidget(a)},_saveSettingsWidget:function(){var t=this;if(t._settings(),storage&&t.o.localStorage){var i=[];t.obj.find(t.o.widgets).each(function(){var t={};t.id=e(this).attr("id"),t.style=e(this).attr("data-widget-attstyle"),t.title=e(this).children("header").children("h2").text(),t.hidden=e(this).is(":hidden")?1:0,t.collapsed=e(this).hasClass("jarviswidget-collapsed")?1:0,i.push(t)});var a=JSON.stringify({widget:i});getKeySettings!=a&&localStorage.setItem(keySettings,a)}"function"==typeof t.o.onSave&&t.o.onSave.call(this,null,a)},_savePositionWidget:function(){var t=this;if(t._settings(),storage&&t.o.localStorage){var i=[];t.obj.find(t.o.grid+".sortable-grid").each(function(){var a=[];e(this).children(t.o.widgets).each(function(){var t={};t.id=e(this).attr("id"),a.push(t)});var l={section:a};i.push(l)});var a=JSON.stringify({grid:i});getKeyPosition!=a&&localStorage.setItem(keyPosition,a,null)}"function"==typeof t.o.onSave&&t.o.onSave.call(this,a)},init:function(){var t=this;if(t._settings(),e("#"+t.objId).length||alert("It looks like your using a class instead of an ID, dont do that!"),t.o.rtl===!0&&e("body").addClass("rtl"),e(t.o.grid).each(function(){e(this).find(t.o.widgets).length&&e(this).addClass("sortable-grid")}),storage&&t.o.localStorage&&getKeyPosition){var i=JSON.parse(getKeyPosition);for(var l in i.grid){var o=t.obj.find(t.o.grid+".sortable-grid").eq(l);for(var s in i.grid[l].section)o.append(e("#"+i.grid[l].section[s].id))}}if(storage&&t.o.localStorage&&getKeySettings){var n=JSON.parse(getKeySettings);for(var l in n.widget){var r=e("#"+n.widget[l].id);n.widget[l].style&&r.removeClassPrefix("jarviswidget-color-").addClass(n.widget[l].style).attr("data-widget-attstyle",""+n.widget[l].style),1==n.widget[l].hidden?r.hide(1):r.show(1).removeAttr("data-widget-hidden"),1==n.widget[l].collapsed&&r.addClass("jarviswidget-collapsed").children("div").hide(1),r.children("header").children("h2").text()!=n.widget[l].title&&r.children("header").children("h2").text(n.widget[l].title)}}if(t.widget.each(function(){var i=e(this),l=e(this).children("header");if(!l.parent().attr("role")){if(i.data("widget-hidden")===!0&&i.hide(),i.data("widget-collapsed")===!0&&i.addClass("jarviswidget-collapsed").children("div").hide(),t.o.customButton===!0&&i.data("widget-custombutton")===a&&0!=t.customClass[0].length)var o='<a href="javascript:void(0);" class="button-icon jarviswidget-custom-btn"><i class="'+t.customClass[0]+'"></i></a>';else o="";if(t.o.deleteButton===!0&&i.data("widget-deletebutton")===a)var s='<a href="javascript:void(0);" class="button-icon jarviswidget-delete-btn" rel="tooltip" title="Delete" data-placement="bottom"><i class="'+t.o.deleteClass+'"></i></a>';else s="";if(t.o.editButton===!0&&i.data("widget-editbutton")===a)var n='<a href="javascript:void(0);" class="button-icon jarviswidget-edit-btn" rel="tooltip" title="Edit Title" data-placement="bottom"><i class="'+t.editClass[0]+'"></i></a>';else n="";if(t.o.fullscreenButton===!0&&i.data("widget-fullscreenbutton")===a)var r='<a href="javascript:void(0);" class="button-icon jarviswidget-fullscreen-btn" rel="tooltip" title="Fullscreen" data-placement="bottom"><i class="'+t.fullscreenClass[0]+'"></i></a>';else r="";if(t.o.colorButton===!0&&i.data("widget-colorbutton")===a){var d='<a data-toggle="dropdown" class="dropdown-toggle color-box selector" href="javascript:void(0);"></a><ul class="dropdown-menu arrow-box-up-right color-select pull-right"><li><span class="bg-color-green" data-widget-setstyle="jarviswidget-color-green" rel="tooltip" data-placement="left" data-original-title="Green Grass"></span></li><li><span class="bg-color-greenDark" data-widget-setstyle="jarviswidget-color-greenDark" rel="tooltip" data-placement="top" data-original-title="Dark Green"></span></li><li><span class="bg-color-greenLight" data-widget-setstyle="jarviswidget-color-greenLight" rel="tooltip" data-placement="top" data-original-title="Light Green"></span></li><li><span class="bg-color-purple" data-widget-setstyle="jarviswidget-color-purple" rel="tooltip" data-placement="top" data-original-title="Purple"></span></li><li><span class="bg-color-magenta" data-widget-setstyle="jarviswidget-color-magenta" rel="tooltip" data-placement="top" data-original-title="Magenta"></span></li><li><span class="bg-color-pink" data-widget-setstyle="jarviswidget-color-pink" rel="tooltip" data-placement="right" data-original-title="Pink"></span></li><li><span class="bg-color-pinkDark" data-widget-setstyle="jarviswidget-color-pinkDark" rel="tooltip" data-placement="left" data-original-title="Fade Pink"></span></li><li><span class="bg-color-blueLight" data-widget-setstyle="jarviswidget-color-blueLight" rel="tooltip" data-placement="top" data-original-title="Light Blue"></span></li><li><span class="bg-color-teal" data-widget-setstyle="jarviswidget-color-teal" rel="tooltip" data-placement="top" data-original-title="Teal"></span></li><li><span class="bg-color-blue" data-widget-setstyle="jarviswidget-color-blue" rel="tooltip" data-placement="top" data-original-title="Ocean Blue"></span></li><li><span class="bg-color-blueDark" data-widget-setstyle="jarviswidget-color-blueDark" rel="tooltip" data-placement="top" data-original-title="Night Sky"></span></li><li><span class="bg-color-darken" data-widget-setstyle="jarviswidget-color-darken" rel="tooltip" data-placement="right" data-original-title="Night"></span></li><li><span class="bg-color-yellow" data-widget-setstyle="jarviswidget-color-yellow" rel="tooltip" data-placement="left" data-original-title="Day Light"></span></li><li><span class="bg-color-orange" data-widget-setstyle="jarviswidget-color-orange" rel="tooltip" data-placement="bottom" data-original-title="Orange"></span></li><li><span class="bg-color-orangeDark" data-widget-setstyle="jarviswidget-color-orangeDark" rel="tooltip" data-placement="bottom" data-original-title="Dark Orange"></span></li><li><span class="bg-color-red" data-widget-setstyle="jarviswidget-color-red" rel="tooltip" data-placement="bottom" data-original-title="Red Rose"></span></li><li><span class="bg-color-redLight" data-widget-setstyle="jarviswidget-color-redLight" rel="tooltip" data-placement="bottom" data-original-title="Light Red"></span></li><li><span class="bg-color-white" data-widget-setstyle="jarviswidget-color-white" rel="tooltip" data-placement="right" data-original-title="Purity"></span></li><li><a href="javascript:void(0);" class="jarviswidget-remove-colors" data-widget-setstyle="" rel="tooltip" data-placement="bottom" data-original-title="Reset widget color to default">Remove</a></li></ul>';l.prepend('<div class="widget-toolbar">'+d+"</div>")}else d="";if(t.o.toggleButton===!0&&i.data("widget-togglebutton")===a){if(i.data("widget-collapsed")===!0||i.hasClass("jarviswidget-collapsed"))var g=t.toggleClass[1];else g=t.toggleClass[0];var c='<a href="#" class="button-icon jarviswidget-toggle-btn" rel="tooltip" title="Collapse" data-placement="bottom"><i class="'+g+'"></i></a>'}else c="";if(t.o.refreshButton===!0&&0!=i.data("widget-refreshbutton")&&i.data("widget-load"))var h='<a href="#" class="button-icon jarviswidget-refresh-btn" data-loading-text="&nbsp;&nbsp;Loading...&nbsp;" rel="tooltip" title="Refresh" data-placement="bottom"><i class="'+t.o.refreshButtonClass+'"></i></a>';else h="";var p=t.o.buttonOrder.replace(/%refresh%/g,h).replace(/%delete%/g,s).replace(/%custom%/g,o).replace(/%fullscreen%/g,r).replace(/%edit%/g,n).replace(/%toggle%/g,c);(""!=h||""!=s||""!=o||""!=r||""!=n||""!=c)&&l.prepend('<div class="jarviswidget-ctrls">'+p+"</div>"),t.o.sortable===!0&&i.data("widget-sortable")===a&&i.addClass("jarviswidget-sortable"),i.find(t.o.editPlaceholder).length&&i.find(t.o.editPlaceholder).find("input").val(e.trim(l.children("h2").text())),l.append('<span class="jarviswidget-loader"><i class="fa fa-refresh fa-spin"></i></span>'),i.attr("role","widget").children("div").attr("role","content").prev("header").attr("role","heading").children("div").attr("role","menu")}}),t.o.buttonsHidden===!0&&e(t.o.pwCtrls).hide(),e(".jarviswidget header [rel=tooltip]").tooltip(),t.obj.find("[data-widget-load]").each(function(){{var i=e(this),a=i.children(),l=i.data("widget-load"),o=1e3*i.data("widget-refresh");i.children()}i.find(".jarviswidget-ajax-placeholder").length||(i.children("widget-body").append('<div class="jarviswidget-ajax-placeholder">'+t.o.loadingLabel+"</div>"),i.data("widget-refresh")>0?(t._loadAjaxFile(i,l,a),setInterval(function(){t._loadAjaxFile(i,l,a)},o)):t._loadAjaxFile(i,l,a))}),t.o.sortable===!0&&jQuery.ui){var d=t.obj.find(".sortable-grid").not("[data-widget-excludegrid]");d.sortable({items:d.find(".jarviswidget-sortable"),connectWith:d,placeholder:t.o.placeholderClass,cursor:"move",revert:!0,opacity:t.o.opacity,delay:200,cancel:".button-icon, #jarviswidget-fullscreen-mode > div",zIndex:1e4,handle:t.o.dragHandle,forcePlaceholderSize:!0,forceHelperSize:!0,update:function(e,i){t._runLoaderWidget(i.item.children()),t._savePositionWidget(),"function"==typeof t.o.onChange&&t.o.onChange.call(this,i.item)}})}t.o.buttonsHidden===!0&&t.widget.children("header").hover(function(){e(this).children(t.o.pwCtrls).stop(!0,!0).fadeTo(100,1)},function(){e(this).children(t.o.pwCtrls).stop(!0,!0).fadeTo(100,0)}),t._clickEvents(),e(t.o.deleteSettingsKey).on(clickEvent,this,function(e){if(storage&&t.o.localStorage){var i=confirm(t.o.settingsKeyLabel);i&&localStorage.removeItem(keySettings)}e.preventDefault()}),e(t.o.deletePositionKey).on(clickEvent,this,function(e){if(storage&&t.o.localStorage){var i=confirm(t.o.positionKeyLabel);i&&localStorage.removeItem(keyPosition)}e.preventDefault()}),storage&&t.o.localStorage&&((null===getKeySettings||getKeySettings.length<1)&&t._saveSettingsWidget(),(null===getKeyPosition||getKeyPosition.length<1)&&t._savePositionWidget())},_clickEvents:function(){function i(){if(e("#jarviswidget-fullscreen-mode").length){var i=e(t).height(),l=e("#jarviswidget-fullscreen-mode").find(a.o.widgets).children("header").height();e("#jarviswidget-fullscreen-mode").find(a.o.widgets).children("div").height(i-l-15)}}var a=this;a._settings(),a.widget.on(clickEvent,".jarviswidget-toggle-btn",function(t){var i=e(this),l=i.parents(a.o.widgets);a._runLoaderWidget(i),l.hasClass("jarviswidget-collapsed")?i.children().removeClass(a.toggleClass[1]).addClass(a.toggleClass[0]).parents(a.o.widgets).removeClass("jarviswidget-collapsed").children("[role=content]").slideDown(a.o.toggleSpeed,function(){a._saveSettingsWidget()}):i.children().removeClass(a.toggleClass[0]).addClass(a.toggleClass[1]).parents(a.o.widgets).addClass("jarviswidget-collapsed").children("[role=content]").slideUp(a.o.toggleSpeed,function(){a._saveSettingsWidget()}),"function"==typeof a.o.onToggle&&a.o.onToggle.call(this,l),t.preventDefault()}),a.widget.on(clickEvent,".jarviswidget-fullscreen-btn",function(t){var l=e(this).parents(a.o.widgets),o=l.children("div");a._runLoaderWidget(e(this)),e("#jarviswidget-fullscreen-mode").length?(e(".nooverflow").removeClass("nooverflow"),l.unwrap("<div>").children("div").removeAttr("style").end().find(".jarviswidget-fullscreen-btn").children().removeClass(a.fullscreenClass[1]).addClass(a.fullscreenClass[0]).parents(a.pwCtrls).children("a").show(),o.hasClass("jarviswidget-visible")&&o.hide().removeClass("jarviswidget-visible")):(e("body").addClass("nooverflow"),l.wrap('<div id="jarviswidget-fullscreen-mode"/>').parent().find(".jarviswidget-fullscreen-btn").children().removeClass(a.fullscreenClass[0]).addClass(a.fullscreenClass[1]).parents(a.pwCtrls).children("a:not(.jarviswidget-fullscreen-btn)").hide(),o.is(":hidden")&&o.show().addClass("jarviswidget-visible")),i(),"function"==typeof a.o.onFullscreen&&a.o.onFullscreen.call(this,l),t.preventDefault()}),e(t).resize(function(){i()}),a.widget.on(clickEvent,".jarviswidget-edit-btn",function(t){var i=e(this).parents(a.o.widgets);a._runLoaderWidget(e(this)),i.find(a.o.editPlaceholder).is(":visible")?e(this).children().removeClass(a.editClass[1]).addClass(a.editClass[0]).parents(a.o.widgets).find(a.o.editPlaceholder).slideUp(a.o.editSpeed,function(){a._saveSettingsWidget()}):e(this).children().removeClass(a.editClass[0]).addClass(a.editClass[1]).parents(a.o.widgets).find(a.o.editPlaceholder).slideDown(a.o.editSpeed),"function"==typeof a.o.onEdit&&a.o.onEdit.call(this,i),t.preventDefault()}),e(a.o.editPlaceholder).find("input").keyup(function(){e(this).parents(a.o.widgets).children("header").children("h2").text(e(this).val())}),a.widget.on(clickEvent,"[data-widget-setstyle]",function(t){var i=e(this).data("widget-setstyle"),l="";e(this).parents(a.o.editPlaceholder).find("[data-widget-setstyle]").each(function(){l+=e(this).data("widget-setstyle")+" "}),e(this).parents(a.o.widgets).attr("data-widget-attstyle",""+i).removeClassPrefix("jarviswidget-color-").addClass(i),a._runLoaderWidget(e(this)),a._saveSettingsWidget(),t.preventDefault()}),a.widget.on(clickEvent,".jarviswidget-custom-btn",function(t){var i=e(this).parents(a.o.widgets);a._runLoaderWidget(e(this)),e(this).children("."+a.customClass[0]).length?(e(this).children().removeClass(a.customClass[0]).addClass(a.customClass[1]),"function"==typeof a.o.customStart&&a.o.customStart.call(this,i)):(e(this).children().removeClass(a.customClass[1]).addClass(a.customClass[0]),"function"==typeof a.o.customEnd&&a.o.customEnd.call(this,i)),a._saveSettingsWidget(),t.preventDefault()}),a.widget.on(clickEvent,".jarviswidget-delete-btn",function(t){var i=e(this).parents(a.o.widgets),l=i.attr("id"),o=i.children("header").children("h2").text();e.SmartMessageBox({title:"<i class='fa fa-times' style='color:#ed1c24'></i> "+a.o.labelDelete+' "'+o+'"',content:"Warning: This action cannot be undone",buttons:"[No][Yes]"},function(t){"Yes"==t&&(a._runLoaderWidget(e(this)),e("#"+l).fadeOut(a.o.deleteSpeed,function(){e(this).remove(),"function"==typeof a.o.onDelete&&a.o.onDelete.call(this,i)}))}),t.preventDefault()}),a.widget.on(clickEvent,".jarviswidget-refresh-btn",function(t){var i=e(this).parents(a.o.widgets),l=i.data("widget-load"),o=i.children(),s=e(this);s.button("loading"),o.addClass("widget-body-ajax-loading"),setTimeout(function(){s.button("reset"),o.removeClass("widget-body-ajax-loading"),a._loadAjaxFile(i,l,o)},1e3),t.preventDefault()})},destroy:function(){var e=this;e.widget.off("click",e._clickEvents()),e.obj.removeData(o)}},e.fn[o]=function(t){return this.each(function(){var i=e(this),a=i.data(o),s="object"==typeof t&&t;a||i.data(o,a=new l(this,s)),"string"==typeof t&&a[t]()})},e.fn[o].defaults={grid:"section",widgets:".jarviswidget",localStorage:!0,deleteSettingsKey:"",settingsKeyLabel:"Reset settings?",deletePositionKey:"",positionKeyLabel:"Reset position?",sortable:!0,buttonsHidden:!1,toggleButton:!0,toggleClass:"min-10 | plus-10",toggleSpeed:200,onToggle:function(){},deleteButton:!0,deleteClass:"trashcan-10",deleteSpeed:200,onDelete:function(){},editButton:!0,editPlaceholder:".jarviswidget-editbox",editClass:"pencil-10 | delete-10",editSpeed:200,onEdit:function(){},colorButton:!0,fullscreenButton:!0,fullscreenClass:"fullscreen-10 | normalscreen-10",fullscreenDiff:3,onFullscreen:function(){},customButton:!0,customClass:"",customStart:function(){},customEnd:function(){},buttonOrder:"%refresh% %delete% %custom% %edit% %fullscreen% %toggle%",opacity:1,dragHandle:"> header",placeholderClass:"jarviswidget-placeholder",indicator:!0,indicatorTime:600,ajax:!0,loadingLabel:"loading...",timestampPlaceholder:".jarviswidget-timestamp",timestampFormat:"Last update: %m%/%d%/%y% %h%:%i%:%s%",refreshButton:!0,refreshButtonClass:"refresh-10",labelError:"Sorry but there was a error:",labelUpdated:"Last Update:",labelRefresh:"Refresh",labelDelete:"Delete widget:",afterLoad:function(){},rtl:!1,onChange:function(){},onSave:function(){},ajaxnav:!0},e.fn.removeClassPrefix=function(t){return this.each(function(i,a){var l=a.className.split(" ").map(function(e){return 0===e.indexOf(t)?"":e});a.className=e.trim(l.join(" "))}),this}}(jQuery,window,document);