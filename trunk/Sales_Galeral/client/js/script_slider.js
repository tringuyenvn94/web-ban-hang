$(document).ready(function() {
    $('#myRoundabout').roundabout({
         shape: 'lazySusan',
		 minScale: 0, // tiny!
         maxScale: 1, // tiny!
		  duration: 1200, // in milliseconds, of course
		 btnNext: '#next',
         btnPrev: '#prev'
		 
    });
			setInterval(setSlideshow,5000);
		function setSlideshow(){
			$('#next').click();
		}
});
