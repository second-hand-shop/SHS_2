/**
 * 
 */
// 주문 상세 조회=================================================
//================================================================
$(".numSelect").each(function(){		
	$(this).click(function(){
		let orderNum = $(this).attr("title");
		window.open("./selectList?orderNum="+orderNum,"WindowName","width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
	});
});

// checkBox=======================================================
// ===============================================================
$(".allCheck").click(function(){
	let allChecked = $(this).prop("checked");
	$(".check").each(function(){
		$(this).prop("checked", allChecked);
	});
});

$(".check").click(function(){
	let result = true;
	$(".check").each(function(){
		if(!$(this).prop("checked")){
			result = false;
		}
	});
	$(".allCheck").prop("checked", result);
});

// 배송상태변경====================================================
// 배송준비중====================================================
$(".ready-shipping").click(function(){
	let confirmed = confirm("'배송준비중' 으로 변경하시겠습니까?");	
	if(confirmed){		
		$(".check").each(function(){
			let check = $(this).prop("checked");
			if(check){			
				let oiNum = $(this).attr("title");
				$.ajax({
					type: "POST",
					url: "./shippingUpdate",
					data: {
						oiNum:oiNum,
						orderProcess:'배송준비중'
					},
					success: function(result){
						//success functions
					}
				});
			}
		});
		location.reload();		
	}
});

// 배송상태변경====================================================
// 배송중====================================================
$(".shipping").click(function(){
	let confirmed = confirm("'배송중' 으로 변경하시겠습니까?");	
	if(confirmed){		
		$(".check").each(function(){
			let check = $(this).prop("checked");
			if(check){			
				let oiNum = $(this).attr("title");
				$.ajax({
					type: "POST",
					url: "./shippingUpdate",
					data: {
						oiNum:oiNum,
						orderProcess:'배송중'
					},
					success: function(result){
						//success functions
					}
				});
			}
		});
		location.reload();		
	}
});

// 배송상태변경====================================================
// 배송완료====================================================
$(".shipped").click(function(){
	let confirmed = confirm("'배송완료' 로 변경하시겠습니까?");	
	if(confirmed){		
		$(".check").each(function(){
			let check = $(this).prop("checked");
			if(check){			
				let oiNum = $(this).attr("title");
				$.ajax({
					type: "POST",
					url: "./shippingUpdate",
					data: {
						oiNum:oiNum,
						orderProcess:'배송완료'
					},
					success: function(result){
						//success functions
					}
				});
			}
		});
		location.reload();		
	}
});

// 송장번호 입력====================================================
//==================================================================
$(".addShipping").click(function(){
	$(".shipNum").each(function(){
		let shipNum = $(this).val();
		if(shipNum != 0){			
			let oiNum = $(this).prop("title");	
			console.log(oiNum);
			console.log(shipNum);
			$.ajax({
				type: "POST",
				url: "./shippingNumUpdate",
				data: {
					shippingNum:shipNum,
					oiNum:oiNum
				},
				success: function(result){
					
				}
			});
		}
	});
	location.reload();
});


// 배송조회 창======================================================
//==================================================================
$(".selectShipping").each(function(){		
	$(this).click(function(){
		let oiNum = $(this).attr("title");
		window.open("./selectShipList?oiNum="+oiNum,"WindowName","width=500, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
	});
});
// 배송조회 ======================================================
//================================================================
$(".shippingSearch").each(function(){
	$(this).click(function(){		
		let shippingNum=$(this).attr("title");
		window.open("http://nplus.doortodoor.co.kr/web/detail.jsp?slipno="+shippingNum,"WindowName","width=700, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
	});
});





