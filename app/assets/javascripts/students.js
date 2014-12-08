$(function(){
	var legend = $('legend');
	$('.toggle-on').hide();
	legend.on("click", ".toggle-off", function(){
		//debugger;
		//console.log(this)
		$(this).parents().children('.panel-body').slideUp();
		//debugger;
		$(this).hide();
		$(this).siblings('.toggle-on').show();
	});

	legend.on("click", ".toggle-on", function(){
		//debugger;
		//console.log(this)
		$(this).parents().children('.panel-body').slideDown();
		$(this).hide();
		$(this).siblings('.toggle-off').show();
	});
});