/**
 * 
 */

$("#nav li").hover(function(){
	$("ul", this).slideDown(200);
	$(this).children("a:first").addClass("hov");
}, function(){
	$("ul", this).slideUp(100);
	$(this).children("a:first").removeClass("hov");
});