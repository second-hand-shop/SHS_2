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

// 회원 주소 조회================================================
//=================================================================
$(".idSelect").each(function(){		
	$(this).click(function(){
		let id = $(this).attr("title");
		window.open("../addressInfo/aInfoList?id="+id,"WindowName","width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
	});
});

// 비회원 주소 조회================================================
//=================================================================
$(".numSelect").each(function(){
	$(this).click(function(){
		let orderNum = $(this).attr("title");
		window.open("../addressInfo/aInfoXList?orderNum="+orderNum,"WindowName","width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
	});
});


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




