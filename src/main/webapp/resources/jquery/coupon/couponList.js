/**
 * 
 */
// couponInsert =================================================
//===============================================================
$(".insert").click(function(){
	let check = confirm("추가하겠습니까?");
	if(check){
		let couponNum = $("#couponNum").val();
		let id = $("#id").val();
		let disRate = $("#disRate").val();
		let disPrice = $("#disPrice").val();
		let usage = $("#usage").val();
		$.ajax({
			type: "POST",
			url: "./couponInsert",
			data: {
					couponNum:couponNum,
					id:id,
					disRate:disRate,
					disPrice:disPrice,
					usage:usage
					},
			success: function(result){
				result = result.trim();
				if(result>0){
					alert("Insert 성공");
					location.reload();
				}
			},
			error: function(result){
				alert("Insert 실패");
			}
		});
	}
}); //------------------------------

// couponDelete =================================================
//===============================================================

$("#deleteBtn").click(function(){
	let checker = confirm("삭제하겠습니까?");
	if(checker){
		$(".check").each(function(){
			let check = $(this).prop("checked"); // T/F 값
			if(check){
				let couponNum = $(this).attr("title");
				console.log(couponNum);
				$.ajax({
					type: "POST",
					url: "./couponDelete",
					data: {couponNum:couponNum},
					success: function(result){
						result = result.trim();
					},
					error: function(result){
						result = result.trim();
						
					}
				});	//---$.ajax END---
			} //---checkbox T/F END---
		}); //---for END---
		location.reload();
	} //---confirm END---
});
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//							DONE								$$$$$
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


// couponSelect =================================================
//===============================================================
// modal로 데이터 넘기기
	function couponSelect() {
		$(".couponSelect").click(function(){
		let couponNum = $(this).attr("title");
		$(".modal-title").html(couponNum);
		$.get("./couponSelect?couponNum="+couponNum, function(result){
			console.log(result);
			$("#modal-id").val(result.id);
			$("#modal-disRate").val(result.disRate);
			$("#modal-disPrice").val(result.disPrice);
			if(result.usage=="Y"){
				$("#selectY").prop("selected", "selected");
			}else {
				$("#selectN").prop("selected", "selected");
			}
		});
	});
}

couponSelect();




// couponUpdate =================================================
//===============================================================
























