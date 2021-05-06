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