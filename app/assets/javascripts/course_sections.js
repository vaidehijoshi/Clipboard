$(function(){
	var legend = $('legend');
	$('.toggle-on').hide();
	$('.sub-toggle-on').hide();
	legend.on("click", ".toggle-off", function(){
		$(this).parents().children('.panel-body').slideUp();
		$(this).hide();
		$(this).siblings('.toggle-on').show();
	});

	legend.on("click", ".toggle-on", function(){
		$(this).parents().children('.panel-body').slideDown();
		$(this).hide();
		$(this).siblings('.toggle-off').show();
	});

	var subLegend = $('legend.sub-legend')

	subLegend.on("click", ".sub-toggle-off", function(){
		$(this).parents().children('.sub-panel-body').slideUp();
		$(this).hide();
		$(this).siblings('.sub-toggle-on').show();
	});

	subLegend.on("click", ".sub-toggle-on", function(){
		$(this).parents().children('.sub-panel-body').slideDown();
		$(this).hide();
		$(this).siblings('.sub-toggle-off').show();
	});
});
