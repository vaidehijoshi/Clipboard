$(function(){
	var legend = $('legend');
	$('.toggle-off').hide();
	$('.guardian-form').hide();
	legend.on("click", ".toggle-on", function(){
		//debugger;
		//console.log(this)
		$(this).parents().children('.guardian-form').slideDown();
		//debugger;
		$(this).hide();
		$(this).siblings('.toggle-off').show();
	});

	legend.on("click", ".toggle-off", function(){
		//debugger;
		//console.log(this)
		$(this).parents().children('.guardian-form').slideUp();
		$(this).hide();
		$(this).siblings('.toggle-on').show();
	});
});