$(document).ready(function() {
	$(".officer").each( function() {
		$(this).find('img:last').hover(
		function() {
			$(this).find('img:last').stop().fadeTo("fast", .9);
			$(this).find('img:last').attr('title','');	
			$(this).siblings('.title').first().fadeTo("fast", 1);
		},
		function() {
			$(this).find('img:last').stop().fadeTo("fast", 1);
			$(this).siblings('.title').first().fadeTo("fast", 0);	
	});
	});
});

