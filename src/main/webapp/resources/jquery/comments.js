/**
 * 
 */

let num =$("#comments").attr("title");

getList();

function getList(){
	$.get("../comments/commentsList?num="+num, function(data){
		console.log(data);
		$("#comments").html(data.trim());
	});
}


$("#write").click(function(){
	let writer = $("#writer").val();
	let contents = $("#contents").val();
	
	$.post("../comments/commentsInsert", {writer:writer, contents:contents, reviewNum:reivewNum}, function(data) {
		
		
		data = data.trim();
		if(data==1){
			alert('등록성공!');
			$("#writer").val('');
			$("#contents").val('');
			getList();
		} else {
			alert('등록실패!');
		}
		
	});


});

