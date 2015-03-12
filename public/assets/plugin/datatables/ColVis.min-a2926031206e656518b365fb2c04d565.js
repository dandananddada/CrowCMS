!function(t){ColVis=function(t,n){return this.CLASS&&"ColVis"==this.CLASS||alert("Warning: ColVis must be initialised with the keyword 'new'"),"undefined"==typeof n&&(n={}),this.s={dt:null,oInit:n,fnStateChange:null,activate:"click",sAlign:"left",buttonText:"Show / hide columns",hidden:!0,aiExclude:[],abOriginal:[],bShowAll:!1,sShowAll:"Show All",bRestore:!1,sRestore:"Restore original",iOverlayFade:500,fnLabel:null,sSize:"auto",bCssPosition:!1},this.dom={wrapper:null,button:null,collection:null,background:null,catcher:null,buttons:[],restore:null},ColVis.aInstances.push(this),this.s.dt=t,this._fnConstruct(),this},ColVis.prototype={fnRebuild:function(){for(var t=this.dom.buttons.length-1;t>=0;t--)null!==this.dom.buttons[t]&&this.dom.collection.removeChild(this.dom.buttons[t]);this.dom.buttons.splice(0,this.dom.buttons.length),this.dom.restore&&this.dom.restore.parentNode(this.dom.restore),this._fnAddButtons(),this._fnDrawCallback()},_fnConstruct:function(){this._fnApplyCustomisation();var n,o,e=this;for(this.dom.wrapper=document.createElement("div"),this.dom.wrapper.className="ColVis TableTools",this.dom.button=this._fnDomBaseButton(this.s.buttonText),this.dom.button.className+=" ColVis_MasterButton",this.dom.wrapper.appendChild(this.dom.button),this.dom.catcher=this._fnDomCatcher(),this.dom.collection=this._fnDomCollection(),this.dom.background=this._fnDomBackground(),this._fnAddButtons(),n=0,o=this.s.dt.aoColumns.length;o>n;n++)this.s.abOriginal.push(this.s.dt.aoColumns[n].bVisible);this.s.dt.aoDrawCallback.push({fn:function(){e._fnDrawCallback.call(e)},sName:"ColVis"}),t(this.s.dt.oInstance).bind("column-reorder",function(t,s,i){for(n=0,o=e.s.aiExclude.length;o>n;n++)e.s.aiExclude[n]=i.aiInvertMapping[e.s.aiExclude[n]];t=e.s.abOriginal.splice(i.iFrom,1)[0],e.s.abOriginal.splice(i.iTo,0,t),e.fnRebuild()})},_fnApplyCustomisation:function(){var t=this.s.oInit;"undefined"!=typeof t.activate&&(this.s.activate=t.activate),"undefined"!=typeof t.buttonText&&(this.s.buttonText=t.buttonText),"undefined"!=typeof t.aiExclude&&(this.s.aiExclude=t.aiExclude),"undefined"!=typeof t.bRestore&&(this.s.bRestore=t.bRestore),"undefined"!=typeof t.sRestore&&(this.s.sRestore=t.sRestore),"undefined"!=typeof t.bShowAll&&(this.s.bShowAll=t.bShowAll),"undefined"!=typeof t.sShowAll&&(this.s.sShowAll=t.sShowAll),"undefined"!=typeof t.sAlign&&(this.s.sAlign=t.sAlign),"undefined"!=typeof t.fnStateChange&&(this.s.fnStateChange=t.fnStateChange),"undefined"!=typeof t.iOverlayFade&&(this.s.iOverlayFade=t.iOverlayFade),"undefined"!=typeof t.fnLabel&&(this.s.fnLabel=t.fnLabel),"undefined"!=typeof t.sSize&&(this.s.sSize=t.sSize),"undefined"!=typeof t.bCssPosition&&(this.s.bCssPosition=t.bCssPosition)},_fnDrawCallback:function(){for(var n=this.s.dt.aoColumns,o=0,e=n.length;e>o;o++)null!==this.dom.buttons[o]&&(n[o].bVisible?t("input",this.dom.buttons[o]).attr("checked","checked"):t("input",this.dom.buttons[o]).removeAttr("checked"))},_fnAddButtons:function(){for(var t,n=","+this.s.aiExclude.join(",")+",",o=0,e=this.s.dt.aoColumns.length;e>o;o++)-1==n.indexOf(","+o+",")?(t=this._fnDomColumnButton(o),this.dom.buttons.push(t),this.dom.collection.appendChild(t)):this.dom.buttons.push(null);this.s.bRestore&&(t=this._fnDomRestoreButton(),t.className+=" ColVis_Restore",this.dom.buttons.push(t),this.dom.collection.appendChild(t)),this.s.bShowAll&&(t=this._fnDomShowAllButton(),t.className+=" ColVis_ShowAll",this.dom.buttons.push(t),this.dom.collection.appendChild(t))},_fnDomRestoreButton:function(){var n=this,o=document.createElement("button"),e=document.createElement("span");return o.className=this.s.dt.bJUI?"ColVis_Button TableTools_Button ui-button ui-state-default":"ColVis_Button TableTools_Button",o.appendChild(e),t(e).html('<span class="ColVis_title">'+this.s.sRestore+"</span>"),t(o).click(function(){for(var t=0,o=n.s.abOriginal.length;o>t;t++)n.s.dt.oInstance.fnSetColumnVis(t,n.s.abOriginal[t],!1);n._fnAdjustOpenRows(),n.s.dt.oInstance.fnAdjustColumnSizing(!1),n.s.dt.oInstance.fnDraw(!1)}),o},_fnDomShowAllButton:function(){var n=this,o=document.createElement("button"),e=document.createElement("span");return o.className=this.s.dt.bJUI?"ColVis_Button TableTools_Button ui-button ui-state-default":"ColVis_Button TableTools_Button",o.appendChild(e),t(e).html('<span class="ColVis_title">'+this.s.sShowAll+"</span>"),t(o).click(function(){for(var t=0,o=n.s.abOriginal.length;o>t;t++)-1===n.s.aiExclude.indexOf(t)&&n.s.dt.oInstance.fnSetColumnVis(t,!0,!1);n._fnAdjustOpenRows(),n.s.dt.oInstance.fnAdjustColumnSizing(!1),n.s.dt.oInstance.fnDraw(!1)}),o},_fnDomColumnButton:function(n){var o=this,e=this.s.dt.aoColumns[n],s=document.createElement("button"),i=document.createElement("span"),l=this.s.dt;return s.className=l.bJUI?"ColVis_Button TableTools_Button ui-button ui-state-default":"ColVis_Button TableTools_Button",s.appendChild(i),e=null===this.s.fnLabel?e.sTitle:this.s.fnLabel(n,e.sTitle,e.nTh),t(i).html('<span class="ColVis_radio"><input type="checkbox"/></span><span class="ColVis_title">'+e+"</span>"),t(s).click(function(e){var s=!t("input",this).is(":checked");"input"==e.target.nodeName.toLowerCase()&&(s=t("input",this).is(":checked")),e=t.fn.dataTableExt.iApiIndex,t.fn.dataTableExt.iApiIndex=o._fnDataTablesApiIndex.call(o),!l.oFeatures.bServerSide||""===l.oScroll.sX&&""===l.oScroll.sY?o.s.dt.oInstance.fnSetColumnVis(n,s):(o.s.dt.oInstance.fnSetColumnVis(n,s,!1),o.s.dt.oInstance.fnAdjustColumnSizing(!1),o.s.dt.oInstance.oApi._fnScrollDraw(o.s.dt),o._fnDrawCallback()),t.fn.dataTableExt.iApiIndex=e,null!==o.s.fnStateChange&&o.s.fnStateChange.call(o,n,s)}),s},_fnDataTablesApiIndex:function(){for(var t=0,n=this.s.dt.oInstance.length;n>t;t++)if(this.s.dt.oInstance[t]==this.s.dt.nTable)return t;return 0},_fnDomBaseButton:function(n){var o=this,e=document.createElement("button"),s=document.createElement("span"),i="mouseover"==this.s.activate?"mouseover":"click";return e.className=this.s.dt.bJUI?"ColVis_Button TableTools_Button ui-button ui-state-default":"ColVis_Button TableTools_Button",e.appendChild(s),s.innerHTML=n,t(e).bind(i,function(t){o._fnCollectionShow(),t.preventDefault()}),e},_fnDomCollection:function(){var n=document.createElement("div");return n.style.display="none",n.className=this.s.dt.bJUI?"ColVis_collection TableTools_collection ui-buttonset ui-buttonset-multi":"ColVis_collection TableTools_collection",this.s.bCssPosition||(n.style.position="absolute"),t(n).css("opacity",0),n},_fnDomCatcher:function(){var n=this,o=document.createElement("div");return o.className="ColVis_catcher TableTools_catcher",t(o).click(function(){n._fnCollectionHide.call(n,null,null)}),o},_fnDomBackground:function(){var n=this,o=document.createElement("div");return o.style.position="absolute",o.style.left="0px",o.style.top="0px",o.className="ColVis_collectionBackground TableTools_collectionBackground",t(o).css("opacity",0),t(o).click(function(){n._fnCollectionHide.call(n,null,null)}),"mouseover"==this.s.activate&&t(o).mouseover(function(){n.s.overcollection=!1,n._fnCollectionHide.call(n,null,null)}),o},_fnCollectionShow:function(){var n,o,e=this;n=t(this.dom.button).offset();var s=this.dom.collection,i=this.dom.background,l=parseInt(n.left,10),a=parseInt(n.top+t(this.dom.button).outerHeight(),10);this.s.bCssPosition||(s.style.top=a+"px",s.style.left=l+"px"),s.style.display="block",t(s).css("opacity",0),o=t(window).height();var u=t(document).height(),d=t(window).width();if(a=t(document).width(),i.style.height=(o>u?o:u)+"px",i.style.width=(a>d?d:a)+"px",o=this.dom.catcher.style,o.height=t(this.dom.button).outerHeight()+"px",o.width=t(this.dom.button).outerWidth()+"px",o.top=n.top+"px",o.left=l+"px",document.body.appendChild(i),document.body.appendChild(s),document.body.appendChild(this.dom.catcher),"auto"==this.s.sSize){for(u=[],this.dom.collection.style.width="auto",n=0,o=this.dom.buttons.length;o>n;n++)null!==this.dom.buttons[n]&&(this.dom.buttons[n].style.width="auto",u.push(t(this.dom.buttons[n]).outerWidth()));for(iMax=Math.max.apply(window,u),n=0,o=this.dom.buttons.length;o>n;n++)null!==this.dom.buttons[n]&&(this.dom.buttons[n].style.width=iMax+"px");this.dom.collection.style.width=iMax+"px"}this.s.bCssPosition||(s.style.left="left"==this.s.sAlign?l+"px":l-t(s).outerWidth()+t(this.dom.button).outerWidth()+"px",n=t(s).outerWidth(),t(s).outerHeight(),l+n>a&&(s.style.left=a-n+"px")),setTimeout(function(){t(s).animate({opacity:1},e.s.iOverlayFade),t(i).animate({opacity:.1},e.s.iOverlayFade,"linear",function(){jQuery.browser.msie&&"6.0"==jQuery.browser.version&&e._fnDrawCallback()})},10),this.s.hidden=!1},_fnCollectionHide:function(){var n=this;this.s.hidden||null===this.dom.collection||(this.s.hidden=!0,t(this.dom.collection).animate({opacity:0},n.s.iOverlayFade,function(){this.style.display="none"}),t(this.dom.background).animate({opacity:0},n.s.iOverlayFade,function(){document.body.removeChild(n.dom.background),document.body.removeChild(n.dom.catcher)}))},_fnAdjustOpenRows:function(){for(var t=this.s.dt.aoOpenRows,n=this.s.dt.oApi._fnVisbleColumns(this.s.dt),o=0,e=t.length;e>o;o++)t[o].nTr.getElementsByTagName("td")[0].colSpan=n}},ColVis.fnRebuild=function(t){var n=null;"undefined"!=typeof t&&(n=t.fnSettings().nTable);for(var o=0,e=ColVis.aInstances.length;e>o;o++)("undefined"==typeof t||n==ColVis.aInstances[o].s.dt.nTable)&&ColVis.aInstances[o].fnRebuild()},ColVis.aInstances=[],ColVis.prototype.CLASS="ColVis",ColVis.VERSION="1.0.8",ColVis.prototype.VERSION=ColVis.VERSION,"function"==typeof t.fn.dataTable&&"function"==typeof t.fn.dataTableExt.fnVersionCheck&&t.fn.dataTableExt.fnVersionCheck("1.7.0")?t.fn.dataTableExt.aoFeatures.push({fnInit:function(t){return new ColVis(t,"undefined"==typeof t.oInit.oColVis?{}:t.oInit.oColVis).dom.wrapper},cFeature:"C",sFeature:"ColVis"}):alert("Warning: ColVis requires DataTables 1.7 or greater - www.datatables.net/download")}(jQuery);