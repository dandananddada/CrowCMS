(function(){var t;t=jQuery,t.fn.extend({rowslide:function(i){var n,e,r;return n=this,e=this.find("td"),$row_id=n.attr("id"),r=this.getTallestTd(e),n.animate({opacity:0},80,function(){var d,a;return e.each(function(){return this!==r?(t(this).empty(),t(this).css("padding","0")):void 0}),d=t(r),a=t("<div/>"),a.css(d.css("padding")),d.css("padding","0"),d.wrapInner(a),d.children("div").animate({height:"hide"},100,"swing",function(){return n.remove(),i?i():void 0})})},getTallestTd:function(i){var n,e;return e=-1,n=0,i.each(function(i,r){return t(r).height()>n?(e=i,n=t(r).height()):void 0}),i.get(e)}})}).call(this);