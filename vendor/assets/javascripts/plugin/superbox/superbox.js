/*
	SuperBox v1.0.0 (modified by bootstraphunter.com)
	by Todd Motto: http://www.toddmotto.com
	Latest version: https://github.com/toddmotto/superbox
	
	Copyright 2013 Todd Motto
	Licensed under the MIT license
	http://www.opensource.org/licenses/mit-license.php

	SuperBox, the lightbox reimagined. Fully responsive HTML5 image galleries.
*/
;(function($) {
		
	$.fn.SuperBox = function(options) {
		
		var superbox      = $('<div class="superbox-show"></div>'),
		    superboximg   = $('<img src="" class="superbox-current-img">'+
						      '<div id="imgInfoBox" class="superbox-imageinfo inline-block">'+
						      '<h1>Image Title</h1><span><p><em></em></p>'+
						      '<p class="superbox-img-description">Image description</p><p>'+
						      '<a class="btn btn-primary btn-sm" data-toggle="modal">修改</a>&nbsp;&nbsp;'+
						      '<a class="btn btn-danger btn-sm" data-method="delete" data-title="您确认要删除图片？" data-confirm="图片删除后将无法恢复，请谨慎操作！">删除</a></p></span></div>'),
			superboxclose = $('<div class="superbox-close txt-color-white"><i class="fa fa-times fa-lg"></i></div>');


             
             
		superbox.append(superboximg).append(superboxclose);
		
		var imgInfoBox = $('.superbox-imageinfo');
		
		return this.each(function() {
			
			$('.superbox-list').click(function() {
				$this = $(this);
		
				var currentimg = $this.find('.superbox-img'),
					imgData = currentimg.data('img'),
					imgDescription = currentimg.attr('alt') || "相片还没有添加描述信息",
					imgLink = imgData,
					imgTitle = currentimg.attr('title') || "相片还没有名称";
					photoId = currentimg.attr('photo_id');
					createdAt = currentimg.attr('created_at')
					//console.log(imgData, imgDescription, imgLink, imgTitle)
					
				superboximg.attr('src', imgData);
				
				$('.superbox-list').removeClass('active');
				$this.addClass('active');
				
				//$('#imgInfoBox em').text(imgLink);
				//$('#imgInfoBox >:first-child').text(imgTitle);
				//$('#imgInfoBox .superbox-img-description').text(imgDescription);
				
				superboximg.find('em').text(createdAt);
				superboximg.find('>:first-child').text(imgTitle);
				superboximg.find('.superbox-img-description').text(imgDescription);
				superboximg.find('.btn.btn-primary.btn-sm').attr('href','/admin/photos/'+photoId+'/edit');
				superboximg.find('.btn.btn-primary.btn-sm').attr('data-target','#myModal_'+photoId);
				superboximg.find('.btn.btn-danger.btn-sm').attr('href','/admin/photos/'+photoId);
				
				//console.log("fierd")
				
				if($('.superbox-current-img').css('opacity') == 0) {
					$('.superbox-current-img').animate({opacity: 1});
				}
				
				if ($(this).next().hasClass('superbox-show')) {
					$('.superbox-list').removeClass('active');
					superbox.toggle();
				} else {
					superbox.insertAfter(this).css('display', 'block');
					$this.addClass('active');
				}
				
				$('html, body').animate({
					scrollTop:superbox.position().top - currentimg.width()
				}, 'medium');
			
			});
						
			$('.superbox').on('click', '.superbox-close', function() {
				$('.superbox-list').removeClass('active');
				$('.superbox-current-img').animate({opacity: 0}, 200, function() {
					$('.superbox-show').slideUp();
				});
			});
		});
	};
})(jQuery);