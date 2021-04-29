/**
 * 
 */


// 회원 비회원 List 조회 =========================================
//================================================================
$("#xMember-btn").click(function(){
	window.location.href="./xMemberList";
});

$("#member-btn").click(function(){
	window.location.href="./memberList";
});


// 비밀번호 * 표시 ===============================================
//================================================================
$(".pw-hide").each(function(){
	let pw = $(this).attr("title");
	let length = pw.length;
	let dotPw="";
	for(let i=0;i<length;i++){
		dotPw= dotPw+"*";
	}
	
	$(this).html(dotPw);	
});

// 주소 조회 modal ================================================
//=================================================================
/*$(".idSelect").click(function(){
		$("#majorAddr-sel").empty();
		let id=$(this).attr("title");
		$(".modal-title").html(id);
		let i = 0;
		$.ajax({
			type: "POST",
			url: "../address/memberAddress",
			data: {id:id},
			success: function(data){
				for( i=0;i<data.length;i++){
					let majorAddr = data[i].majorAddr;
					$("#majorAddr-sel").append("<option id='addr-sel"+i+"'"+">"+majorAddr+"</option>");					
				} //===for END===
			} //===success END===
		});
		console.log(i);
});*/




