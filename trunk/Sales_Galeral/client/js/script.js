jQuery(document).ready(function(){
	// hide #back-top first
	jQuery("#back-top").hide();
	// fade in #back-top
	jQuery(function () {
		jQuery(window).scroll(function () {
			if (jQuery(this).scrollTop() > 100) {
				jQuery('#back-top').fadeIn();
			} else {
				jQuery('#back-top').fadeOut();
			}
		});

		// scroll body to 0px on click
		jQuery('#back-top a').click(function () {
			jQuery('body,html').animate({
				scrollTop: 0
			}, 800);
			return false;
		});
	});
	
	/*jQuery('img.jqzoom').jqueryzoom({
			xzoom: 200, //zooming div default width(default width value is 200)
			yzoom: 200, //zooming div default width(default height value is 200)
			offset: 21 //zooming div default offset(default offset value is 10)
			//position: "right" //zooming div position(default position value is "right")
	});*/
	
/*	jQuery('#views_block li a').hover(
		function(){displayImage(jQuery(this));},
		function(){}
	);*/

	/*jQuery('.thickbox').fancybox({
		'hideOnContentClick': true,
		'transitionIn'	: 'elastic',
		'transitionOut'	: 'elastic'
	});
	
    jQuery('#views_block').jcarousel({
    	wrap: 'circular'
    });
	
	
	jQuery('#footer').find('p').append(' <a href="http://www.themescss.com/">Free Template CSS</a>');  */

	
	//update display of the large image
	function displayImage(domAAroundImgThumb){
		if (domAAroundImgThumb.attr('href')){
			var newSrc = domAAroundImgThumb.attr('href').replace('thickbox','large');
			if (jQuery('#bigpic').attr('src') != newSrc){
				jQuery('#bigpic').fadeOut('fast', function(){
					jQuery(this).attr('src', newSrc).fadeIn();
					jQuery(this).attr('alt', domAAroundImgThumb.attr('href'));
				});
			}
			jQuery('#views_block li a').removeClass('shown');
			jQuery(domAAroundImgThumb).addClass('shown');
		}
	}
	
});