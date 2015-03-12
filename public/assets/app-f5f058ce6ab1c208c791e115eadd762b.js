function nav_page_height(){$.left_panel=$("#left-panel"),$.root_=$("body");var e=$("#main").height(),t=$(window).height()-$.navbar_height;e>t?($.left_panel.css("min-height",e+"px"),$.root_.css("min-height",e+$.navbar_height+"px")):($.left_panel.css("min-height",t+"px"),$.root_.css("min-height",t+"px"))}function check_if_mobile_width(){$(window).width()<979?$.root_.addClass("mobile-view-activated"):$.root_.hasClass("mobile-view-activated")&&$.root_.removeClass("mobile-view-activated")}function launchFullscreen(e){$.root_.hasClass("full-screen")?($.root_.removeClass("full-screen"),document.exitFullscreen?document.exitFullscreen():document.mozCancelFullScreen?document.mozCancelFullScreen():document.webkitExitFullscreen&&document.webkitExitFullscreen()):($.root_.addClass("full-screen"),e.requestFullscreen?e.requestFullscreen():e.mozRequestFullScreen?e.mozRequestFullScreen():e.webkitRequestFullscreen?e.webkitRequestFullscreen():e.msRequestFullscreen&&e.msRequestFullscreen())}function runAllForms(){$.fn.slider&&$(".slider").slider(),$.fn.select2&&$(".select2").each(function(){var e=$(this),t=e.attr("data-select-width")||"100%";e.select2({allowClear:!0,width:t})}),$.fn.mask&&$("[data-mask]").each(function(){var e=$(this),t=e.attr("data-mask")||"error...",a=e.attr("data-mask-placeholder")||"X";e.mask(t,{placeholder:a})}),$.fn.autocomplete&&$("[data-autocomplete]").each(function(){var e=$(this),t=e.data("autocomplete")||["The","Quick","Brown","Fox","Jumps","Over","Three","Lazy","Dogs"];e.autocomplete({source:t})}),$.fn.datepicker&&$(".datepicker").each(function(){var e=$(this),t=e.attr("data-dateformat")||"dd.mm.yy";e.datepicker({dateFormat:t,prevText:'<i class="fa fa-chevron-left"></i>',nextText:'<i class="fa fa-chevron-right"></i>'})}),$("button[data-loading-text]").on("click",function(){var e=$(this);e.button("loading"),setTimeout(function(){e.button("reset")},3e3)})}function runAllCharts(){$.fn.sparkline&&$(".sparkline").each(function(){var e=$(this),t=e.data("sparkline-type")||"bar";if("bar"==t){var a=e.data("sparkline-bar-color")||e.css("color")||"#0000f0",i=e.data("sparkline-height")||"26px",o=e.data("sparkline-barwidth")||5,n=e.data("sparkline-barspacing")||2,r=e.data("sparkline-negbar-color")||"#A90329",l=e.data("sparkline-barstacked-color")||["#A90329","#0099c6","#98AA56","#da532c","#4490B1","#6E9461","#990099","#B4CAD3"];e.sparkline("html",{type:"bar",barColor:a,type:t,height:i,barWidth:o,barSpacing:n,stackedBarColor:l,negBarColor:r,zeroAxis:"false"})}if("line"==t){var i=e.data("sparkline-height")||"20px",s=e.data("sparkline-width")||"90px",d=e.data("sparkline-line-color")||e.css("color")||"#0000f0",c=e.data("sparkline-line-width")||1,h=e.data("fill-color")||"#c0d0f0",p=e.data("sparkline-spot-color")||"#f08000",u=e.data("sparkline-minspot-color")||"#ed1c24",f=e.data("sparkline-maxspot-color")||"#f08000",g=e.data("sparkline-highlightspot-color")||"#50f050",m=e.data("sparkline-highlightline-color")||"f02020",v=e.data("sparkline-spotradius")||1.5;thisChartMinYRange=e.data("sparkline-min-y")||"undefined",thisChartMaxYRange=e.data("sparkline-max-y")||"undefined",thisChartMinXRange=e.data("sparkline-min-x")||"undefined",thisChartMaxXRange=e.data("sparkline-max-x")||"undefined",thisMinNormValue=e.data("min-val")||"undefined",thisMaxNormValue=e.data("max-val")||"undefined",thisNormColor=e.data("norm-color")||"#c0c0c0",thisDrawNormalOnTop=e.data("draw-normal")||!1,e.sparkline("html",{type:"line",width:s,height:i,lineWidth:c,lineColor:d,fillColor:h,spotColor:p,minSpotColor:u,maxSpotColor:f,highlightSpotColor:g,highlightLineColor:m,spotRadius:v,chartRangeMin:thisChartMinYRange,chartRangeMax:thisChartMaxYRange,chartRangeMinX:thisChartMinXRange,chartRangeMaxX:thisChartMaxXRange,normalRangeMin:thisMinNormValue,normalRangeMax:thisMaxNormValue,normalRangeColor:thisNormColor,drawNormalOnTop:thisDrawNormalOnTop})}if("pie"==t){var b=e.data("sparkline-piecolor")||["#B4CAD3","#4490B1","#98AA56","#da532c","#6E9461","#0099c6","#990099","#717D8A"],k=e.data("sparkline-piesize")||90,w=e.data("border-color")||"#45494C",C=e.data("sparkline-offset")||0;e.sparkline("html",{type:"pie",width:k,height:k,tooltipFormat:'<span style="color: {{color}}">&#9679;</span> ({{percent.1}}%)',sliceColors:b,offset:0,borderWidth:1,offset:C,borderColor:w})}if("box"==t){var x=e.data("sparkline-width")||"auto",y=e.data("sparkline-height")||"auto",_=e.data("sparkline-boxraw")||!1,S=e.data("sparkline-targetval")||"undefined",R=e.data("sparkline-min")||"undefined",j=e.data("sparkline-max")||"undefined",M=e.data("sparkline-showoutlier")||!0,A=e.data("sparkline-outlier-iqr")||1.5,L=e.data("sparkline-spotradius")||1.5,D=e.css("color")||"#000000",F=e.data("fill-color")||"#c0d0f0",T=e.data("sparkline-whis-color")||"#000000",B=e.data("sparkline-outline-color")||"#303030",z=e.data("sparkline-outlinefill-color")||"#f0f0f0",E=e.data("sparkline-outlinemedian-color")||"#f00000",W=e.data("sparkline-outlinetarget-color")||"#40a020";e.sparkline("html",{type:"box",width:x,height:y,raw:_,target:S,minValue:R,maxValue:j,showOutliers:M,outlierIQR:A,spotRadius:L,boxLineColor:D,boxFillColor:F,whiskerColor:T,outlierLineColor:B,outlierFillColor:z,medianColor:E,targetColor:W})}if("bullet"==t){var N=e.data("sparkline-height")||"auto",U=e.data("sparkline-width")||2,O=e.data("sparkline-bullet-color")||"#ed1c24",q=e.data("sparkline-performance-color")||"#3030f0",I=e.data("sparkline-bulletrange-color")||["#d3dafe","#a8b6ff","#7f94ff"];e.sparkline("html",{type:"bullet",height:N,targetWidth:U,targetColor:O,performanceColor:q,rangeColors:I})}if("discrete"==t){var P=e.data("sparkline-height")||26,V=e.data("sparkline-width")||50,X=e.css("color"),H=e.data("sparkline-line-height")||5,Y=e.data("sparkline-threshold")||"undefined",Q=e.data("sparkline-threshold-color")||"#ed1c24";e.sparkline("html",{type:"discrete",width:V,height:P,lineColor:X,lineHeight:H,thresholdValue:Y,thresholdColor:Q})}if("tristate"==t){var J=e.data("sparkline-height")||26,K=(e.data("sparkline-posbar-color")||"#60f060",e.data("sparkline-negbar-color")||"#f04040"),G=e.data("sparkline-zerobar-color")||"#909090",Z=e.data("sparkline-barwidth")||5,et=e.data("sparkline-barspacing")||2,tt=e.data("sparkline-zeroaxis")||!1;e.sparkline("html",{type:"tristate",height:J,posBarColor:at,negBarColor:K,zeroBarColor:G,barWidth:Z,barSpacing:et,zeroAxis:tt})}if("compositebar"==t){var i=e.data("sparkline-height")||"20px",s=e.data("sparkline-width")||"100%",o=e.data("sparkline-barwidth")||3,c=e.data("sparkline-line-width")||1,d=e.data("sparkline-color-top")||"#ed1c24",at=e.data("sparkline-color-bottom")||"#333333";e.sparkline(e.data("sparkline-bar-val"),{type:"bar",width:s,height:i,barColor:at,barWidth:o}),e.sparkline(e.data("sparkline-line-val"),{width:s,height:i,lineColor:d,lineWidth:c,composite:!0,fillColor:!1})}if("compositeline"==t){var i=e.data("sparkline-height")||"20px",s=e.data("sparkline-width")||"90px",it=e.data("sparkline-bar-val"),ot=e.data("sparkline-bar-val-spots-top")||null,nt=e.data("sparkline-bar-val-spots-bottom")||null,rt=e.data("sparkline-line-width-top")||1,lt=e.data("sparkline-line-width-bottom")||1,st=e.data("sparkline-color-top")||"#333333",dt=e.data("sparkline-color-bottom")||"#ed1c24",ct=e.data("sparkline-spotradius-top")||1.5,ht=e.data("sparkline-spotradius-bottom")||ct,p=e.data("sparkline-spot-color")||"#f08000",pt=e.data("sparkline-minspot-color-top")||"#ed1c24",ut=e.data("sparkline-maxspot-color-top")||"#f08000",ft=e.data("sparkline-minspot-color-bottom")||pt,gt=e.data("sparkline-maxspot-color-bottom")||ut,mt=e.data("sparkline-highlightspot-color-top")||"#50f050",$t=e.data("sparkline-highlightline-color-top")||"#f02020",vt=e.data("sparkline-highlightspot-color-bottom")||mt,bt=e.data("sparkline-highlightline-color-bottom")||$t,kt=e.data("sparkline-fillcolor-top")||"transparent",wt=e.data("sparkline-fillcolor-bottom")||"transparent";e.sparkline(it,{type:"line",spotRadius:ct,spotColor:p,minSpotColor:pt,maxSpotColor:ut,highlightSpotColor:mt,highlightLineColor:$t,valueSpots:ot,lineWidth:rt,width:s,height:i,lineColor:st,fillColor:kt}),e.sparkline(e.data("sparkline-line-val"),{type:"line",spotRadius:ht,spotColor:p,minSpotColor:ft,maxSpotColor:gt,highlightSpotColor:vt,highlightLineColor:bt,valueSpots:nt,lineWidth:lt,width:s,height:i,lineColor:dt,composite:!0,fillColor:wt})}}),$.fn.easyPieChart&&$(".easy-pie-chart").each(function(){var e=$(this),t=e.css("color")||e.data("pie-color"),a=e.data("pie-track-color")||"#eeeeee",i=parseInt(e.data("pie-size"))||25;e.easyPieChart({barColor:t,trackColor:a,scaleColor:!1,lineCap:"butt",lineWidth:parseInt(i/8.5),animate:1500,rotate:-90,size:i,onStep:function(e){this.$el.find("span").text(~~e)}})})}function setup_widgets_desktop(){$.fn.jarvisWidgets&&$.enableJarvisWidgets&&$("#widget-grid").jarvisWidgets({grid:"article",widgets:".jarviswidget",localStorage:!0,deleteSettingsKey:"#deletesettingskey-options",settingsKeyLabel:"Reset settings?",deletePositionKey:"#deletepositionkey-options",positionKeyLabel:"Reset position?",sortable:!0,buttonsHidden:!1,toggleButton:!0,toggleClass:"fa fa-minus | fa fa-plus",toggleSpeed:200,onToggle:function(){},deleteButton:!1,deleteClass:"fa fa-times",deleteSpeed:200,onDelete:function(){},editButton:!0,editPlaceholder:".jarviswidget-editbox",editClass:"fa fa-cog | fa fa-save",editSpeed:200,onEdit:function(){},colorButton:!1,fullscreenButton:!0,fullscreenClass:"fa fa-resize-full | fa fa-resize-small",fullscreenDiff:3,onFullscreen:function(){},customButton:!1,customClass:"folder-10 | next-10",customStart:function(){alert("Hello you, this is a custom button...")},customEnd:function(){alert("bye, till next time...")},buttonOrder:"%refresh% %custom% %edit% %toggle% %fullscreen% %delete%",opacity:1,dragHandle:"> header",placeholderClass:"jarviswidget-placeholder",indicator:!0,indicatorTime:600,ajax:!1,timestampPlaceholder:".jarviswidget-timestamp",timestampFormat:"Last update: %m%/%d%/%y% %h%:%i%:%s%",refreshButton:!0,refreshButtonClass:"fa fa-refresh",labelError:"Sorry but there was a error:",labelUpdated:"Last Update:",labelRefresh:"Refresh",labelDelete:"Delete widget:",afterLoad:function(){},rtl:!1,onChange:function(){},onSave:function(){},ajaxnav:$.navAsAjax})}function setup_widgets_mobile(){$.enableMobileWidgets&&$.enableJarvisWidgets&&setup_widgets_desktop()}function loadScript(e,t){if(jsArray[e])t&&t();else{jsArray[e]=!0;var a=document.getElementsByTagName("body")[0],i=document.createElement("script");i.type="text/javascript",i.src=e,i.onload=t,a.appendChild(i)}}function checkURL(){var e=location.hash.replace(/^#/,"");if(container=$("#content"),e){$("nav li.active").removeClass("active"),$('nav li:has(a[href="'+e+'"])').addClass("active");var t=$('nav a[href="'+e+'"]').attr("title");document.title=t||document.title,loadURL(e+location.search,container)}else{var a=$('nav > ul > li:first-child > a[href!="#"]');window.location.hash=a.attr("href")}}function loadURL(e,t){$.ajax({type:"GET",url:e,dataType:"html",cache:!0,beforeSend:function(){t.html('<h1><i class="fa fa-cog fa-spin"></i> Loading...</h1>'),t[0]==$("#content")[0]&&(drawBreadCrumb(),$("html").animate({scrollTop:0},"fast"))},success:function(e){t.css({opacity:"0.0"}).html(e).delay(50).animate({opacity:"1.0"},300)},error:function(){t.html('<h4 style="margin-top:10px; display:block; text-align:left"><i class="fa fa-warning txt-color-orangeDark"></i> Error 404! Page not found.</h4>')},async:!1})}function drawBreadCrumb(){var e=$("nav li.active > a"),t=e.length;$.bread_crumb.empty(),$.bread_crumb.append($("<li>Home</li>")),e.each(function(){$.bread_crumb.append($("<li></li>").html($.trim($(this).clone().children(".badge").remove().end().text()))),--t||(document.title=$.bread_crumb.find("li:last-child").text())})}function pageSetUp(){"desktop"===$.device?($("[rel=tooltip]").tooltip(),$("[rel=popover]").popover(),$("[rel=popover-hover]").popover({trigger:"hover"}),runAllCharts(),setup_widgets_desktop(),nav_page_height(),runAllForms()):($("[rel=popover]").popover(),$("[rel=popover-hover]").popover({trigger:"hover"}),runAllCharts(),setup_widgets_mobile(),nav_page_height(),runAllForms())}$.throttle_delay=350,$.menu_speed=235,$.navbar_height=49,$.root_=$("body"),$.left_panel=$("#left-panel"),$.shortcut_dropdown=$("#shortcut"),$.bread_crumb=$("#ribbon ol.breadcrumb"),$.device=null,$.navAsAjax=!1,$.enableJarvisWidgets=!0,$.enableMobileWidgets=!1;var ismobile=/iphone|ipad|ipod|android|blackberry|mini|windows\sce|palm/i.test(navigator.userAgent.toLowerCase());ismobile?($.root_.addClass("mobile-detected"),$.device="mobile"):($.root_.addClass("desktop-detected"),$.device="desktop"),$.fn.extend({jarvismenu:function(e){var t={accordion:"true",speed:200,closedSign:"[+]",openedSign:"[-]"},a=$.extend(t,e),i=$(this);i.find("li").each(function(){0!=$(this).find("ul").size()&&($(this).find("a:first").append("<b class='collapse-sign'>"+a.closedSign+"</b>"),"#"==$(this).find("a:first").attr("href")&&$(this).find("a:first").click(function(){return!1}))}),i.find("li.active").each(function(){$(this).parents("ul").slideDown(a.speed),$(this).parents("ul").parent("li").find("b:first").html(a.openedSign),$(this).parents("ul").parent("li").addClass("open")}),i.find("li a").click(function(){0!=$(this).parent().find("ul").size()&&(a.accordion&&($(this).parent().find("ul").is(":visible")||(parents=$(this).parent().parents("ul"),visible=i.find("ul:visible"),visible.each(function(e){var t=!0;parents.each(function(a){return parents[a]==visible[e]?(t=!1,!1):void 0}),t&&$(this).parent().find("ul")!=visible[e]&&$(visible[e]).slideUp(a.speed,function(){$(this).parent("li").find("b:first").html(a.closedSign),$(this).parent("li").removeClass("open")})}))),$(this).parent().find("ul:first").is(":visible")&&!$(this).parent().find("ul:first").hasClass("active")?$(this).parent().find("ul:first").slideUp(a.speed,function(){$(this).parent("li").removeClass("open"),$(this).parent("li").find("b:first").delay(a.speed).html(a.closedSign)}):$(this).parent().find("ul").slideDown(a.speed,function(){$(this).parent("li").addClass("open"),$(this).parent("li").find("b:first").delay(a.speed).html(a.openedSign)}))}),$("nav").find("ul").slideDown(235),$("nav").find("ul li").addClass("open"),$("nav").find("ul li").find("b:first").html(a.openedSign)}}),$(document).ready(function(){function e(){$this=$("#activity > .badge"),parseInt($this.text())>0&&$this.addClass("bg-color-red bounceIn animated")}function t(){$.shortcut_dropdown.animate({height:"hide"},300,"easeOutCirc"),$.root_.removeClass("shortcut-on")}function a(){$.shortcut_dropdown.animate({height:"show"},200,"easeOutCirc"),$.root_.addClass("shortcut-on")}$("[rel=tooltip]").length&&$("[rel=tooltip]").tooltip(),nav_page_height(),$("nav ul").jarvismenu({accordion:!0,speed:$.menu_speed,closedSign:'<em class="fa fa-expand-o"></em>',openedSign:'<em class="fa fa-collapse-o"></em>'}),$(".minifyme").click(function(e){$("body").toggleClass("minified"),$(this).effect("highlight",{},500),e.preventDefault()}),$("#hide-menu >:first-child > a").click(function(e){$("body").toggleClass("hidden-menu"),e.preventDefault()}),$("#show-shortcut").click(function(e){$.shortcut_dropdown.is(":visible")?t():a(),e.preventDefault()}),$("#search-mobile").click(function(){$.root_.addClass("search-mobile")}),$("#cancel-search-js").click(function(){$.root_.removeClass("search-mobile")}),$("#activity").click(function(e){var t=$(this);t.find(".badge").hasClass("bg-color-red")&&(t.find(".badge").removeClassPrefix("bg-color-"),t.find(".badge").text("0")),t.next(".ajax-dropdown").is(":visible")?(t.next(".ajax-dropdown").fadeOut(150),t.removeClass("active")):(t.next(".ajax-dropdown").fadeIn(150),t.addClass("active"));t.next(".ajax-dropdown").find(".btn-group > .active > input").attr("id");e.preventDefault()}),$('input[name="activity"]').change(function(){var e=$(this);url=e.attr("id"),container=$(".ajax-notifications"),loadURL(url,container)}),$(document).mouseup(function(e){$(".ajax-dropdown").is(e.target)||0!==$(".ajax-dropdown").has(e.target).length||($(".ajax-dropdown").fadeOut(150),$(".ajax-dropdown").prev().removeClass("active"))}),$("button[data-loading-text]").on("click",function(){var e=$(this);e.button("loading"),setTimeout(function(){e.button("reset")},3e3)}),e(),$("#refresh").click(function(e){$.SmartMessageBox({title:"<i class='fa fa-refresh' style='color:green'></i> Clear Local Storage",content:"Would you like to RESET all your saved widgets and clear LocalStorage?",buttons:"[No][Yes]"},function(e){"Yes"==e&&localStorage&&(localStorage.clear(),location.reload())}),e.preventDefault()}),$("#logout a").click(function(e){var t=$(this);$.loginURL=t.attr("href"),$.logoutMSG=t.data("logout-msg"),e.preventDefault()}),$.shortcut_dropdown.find("a").click(function(e){e.preventDefault(),window.location=$(this).attr("href"),setTimeout(t,300)}),$(document).mouseup(function(e){$.shortcut_dropdown.is(e.target)||0!==$.shortcut_dropdown.has(e.target).length||t()})}),function(e,t,a){function i(){o=t[l](function(){n.each(function(){var t=e(this),a=t.width(),i=t.height(),o=e.data(this,d);(a!==o.w||i!==o.h)&&t.trigger(s,[o.w=a,o.h=i])}),i()},r[c])}var o,n=e([]),r=e.resize=e.extend(e.resize,{}),l="setTimeout",s="resize",d=s+"-special-event",c="delay",h="throttleWindow";r[c]=e.throttle_delay,r[h]=!0,e.event.special[s]={setup:function(){if(!r[h]&&this[l])return!1;var t=e(this);n=n.add(t),e.data(this,d,{w:t.width(),h:t.height()}),1===n.length&&i()},teardown:function(){if(!r[h]&&this[l])return!1;var t=e(this);n=n.not(t),t.removeData(d),n.length||clearTimeout(o)},add:function(t){function i(t,i,n){var r=e(this),l=e.data(this,d);l.w=i!==a?i:r.width(),l.h=n!==a?n:r.height(),o.apply(this,arguments)}if(!r[h]&&this[l])return!1;var o;return e.isFunction(t)?(o=t,i):(o=t.handler,void(t.handler=i))}}}(jQuery,this),$("#main").resize(function(){nav_page_height(),check_if_mobile_width()}),$("nav").resize(function(){nav_page_height()});var ie=function(){for(var e,t=3,a=document.createElement("div"),i=a.getElementsByTagName("i");a.innerHTML="<!--[if gt IE "+ ++t+"]><i></i><![endif]-->",i[0];);return t>4?t:e}();jQuery.fn.doesExist=function(){return jQuery(this).length>0};var gMapsLoaded=!1;window.gMapsCallback=function(){gMapsLoaded=!0,$(window).trigger("gMapsLoaded")},window.loadGoogleMaps=function(){if(gMapsLoaded)return window.gMapsCallback();var e=document.createElement("script");e.setAttribute("type","text/javascript"),e.setAttribute("src","http://maps.google.com/maps/api/js?sensor=false&callback=gMapsCallback"),(document.getElementsByTagName("head")[0]||document.documentElement).appendChild(e)};var jsArray={};$.navAsAjax&&($("nav").length&&checkURL(),$(document).on("click",'nav a[href!="#"]',function(e){e.preventDefault();var t=$(e.currentTarget);t.parent().hasClass("active")||t.attr("target")||($.root_.hasClass("mobile-view-activated")?($.root_.removeClass("hidden-menu"),window.setTimeout(function(){window.location.search?window.location.href=window.location.href.replace(window.location.search,"").replace(window.location.hash,"")+"#"+t.attr("href"):window.location.hash=t.attr("href")},150)):window.location.search?window.location.href=window.location.href.replace(window.location.search,"").replace(window.location.hash,"")+"#"+t.attr("href"):window.location.hash=t.attr("href"))}),$(document).on("click",'nav a[target="_blank"]',function(e){e.preventDefault();var t=$(e.currentTarget);window.open(t.attr("href"))}),$(document).on("click",'nav a[target="_top"]',function(e){e.preventDefault();var t=$(e.currentTarget);window.location=t.attr("href")}),$(document).on("click",'nav a[href="#"]',function(e){e.preventDefault()}),$(window).on("hashchange",function(){checkURL()})),$("body").on("click",function(e){$('[rel="popover"]').each(function(){$(this).is(e.target)||0!==$(this).has(e.target).length||0!==$(".popover").has(e.target).length||$(this).popover("hide")})});