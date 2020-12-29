$(function() {
	$('#leftmenu a').css('marginLeft', '-110px');
	$('#leftmenu > li').hover(function() {
		$('a', $(this)).stop().animate({
			'marginLeft' : '-1px'
		}, 300);
	}, function() {
		$('a', $(this)).stop().animate({
			'marginLeft' : '-85px'
		}, 300);
	});
});