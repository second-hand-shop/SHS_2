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

/*$(".delete").click(function(){
	let check = confirm("삭제하시겠습니까?");
	if(check){
		let couponNum = $(".delete").attr("title");
		$.ajax({
			type: "POST",
			url: "./couponDelete",
			data: {couponNum:couponNum},
			success: function(result){
				result=result.trim();
				if(result>0){
					alert("Delete 성공");
					location.reload();
				}
			},
			error: function(result){
				alert("Delete 실패");
			}
		});
		
	}
});*/ //-------------------------------

// couponSelect =================================================
//===============================================================
// modal로 데이터 넘기기
	function couponSelect() {
		$("#couponSelect").click(function(){
		/*let couponNum = $("#couponSelect").html();
		$(".modal-title").html(couponNum);
		console.log(couponNum);*/
		let i = $("#delNum").attr("title");
		console.log(i);
	});
}




// couponUpdate =================================================
//===============================================================
























