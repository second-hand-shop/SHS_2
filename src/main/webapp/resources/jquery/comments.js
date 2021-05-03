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
	
	$.post("../comments/commentsInsert", {writer:writer, contents:contents, num:num}, function(data) {
		
		
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

//comments안에 자식으로 보내는 것 on
$("#comments").on("click", "#remove", function(){
	
	const ar = []; //빈 배열 , 체크된 것만 집어넣을 것
	
	$(".del").each(function(){
	
		let ch = $(this).prop("checked");
	
		if(ch){
			ar.push($(this).val());
		}
	
	});
	
	console.log(ar);
	$.ajax({
		
		type:	"POST",
		url:	"../comments/commentsDelete",
		traditional: true,	//배열은 전송
		data:	{commentNum:ar},
		success: function(data){
			alert(data);
		}
	});
	
});

