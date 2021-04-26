<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<title>SHS</title>
<style type="text/css">

/* tabel,td{
border-collapse: collapse;
} */
#productImg {
	max-width: 100%;
	width: 110px;
	height: auto;
	overflow: hidden;
}

#mainTitle {
	display: flex;
	justify-content: center;
	font-size: medium;
}

table {
	font-size: x-small;
	border: 1px solid #ccc;
	margin: auto;
	height: 5%;
	overflow: hidden;
	padding: 100px;
}

table tr {
	font-size: small;
	border: 1px solid #ccc;
	margin: auto;
}

table td {
	line-height: 2;
	font-size: small;
	border: 1px solid #ccc;
	padding: 10px;
	margin: auto;
	vertical-align: middle;
}

#productTable td {
	text-align: center;
}


textarea{
overflow-y:scroll;
}



.button_base {
    margin: 0;
    border: 0;
    font-size: 18px;
    position: relative;
    top: 50%;
    left: 50%;
    margin-top: -25px;
    margin-left: -100px;
    width: 200px;
    height: 50px;
    text-align: center;
    box-sizing: border-box;
}

.button_base:hover {
    cursor: pointer;
} 


.b01_simple_rollover {
    color: #000000;
    border: #000000 solid 1px;
    padding: 10px;
    background-color: #ffffff;
}

.b01_simple_rollover:hover {
    color: #ffffff;
    background-color: #000000;
}



</style>
</head>
<body>
	<div id="wrap1">
		<div id="header">
			<c:import url="../template/header.jsp"></c:import>
		</div>
		<!-- header END -->
		<div id="container">
			<div id="contents">


				<h3 id="mainTitle">orderForm</h3>
				<br> <br> <br>



				<!-- 상품  -->

				<table id="productTable" style="margin-bottom: 40px">

					<thead>
						<tr>
							<td>이미지</td>
							<td>상품정보</td>
							<td>판매가</td>
							<td>수량</td>
							<td>적립금</td>
							<td>배송비</td>
							<td>합계</td>
						</tr>
					</thead>

					<tbody>
						<!--  foreach로 장바구니에서 받아온 ar 뿌려줘야할듯-->

						<tr>
							<td><div>
									<img id="productImg"
										src="../resources/upload/images/${dto.productImages[0].thumbnail}">
								</div></td>
							<td id="productName">${dto.productName}</td>
							<td id="productPrice"><strong>${dto.price}</strong></td>
							<td>${dto.amount}</td>
							<td>적립금</td>
							<td>배송비</td>
							<td>합계</td>
						</tr>

					</tbody>

				</table>


				<br>
				<hr>
				<br>


				<!-- 세션에서 회원인지 구분하고 비회원일시 주문조회 비밀번호 받아와야한다 -->
				<!-- 배송정보 -->
				<!-- 원래는 표를,, 넣어야 될거같다 -->



				<!-- 			주문조회 비밀번호<input>
			주문조회 비밀번호확인<input> -->
				<!-- 배송지 선택 - 주소록 기능 - 추가 가능? -->
				<table style="margin-top: 40px">

					<tr>
						<td style="width: 200px;">
						<div style="display: inline-block; color:#F27500;'">*</div><div style="display: inline-block;">받으시는 분</div>
						</td>
						<td><input type="text" ><br></td>
					</tr>
					<tr>
						<td rowspan="2">
						<div style="display: inline-block; color:#F27500;'">*</div><div style="display: inline-block;">주소</div>
						</td>
						<td><input type="text" id="sample3_postcode"
							placeholder="우편번호" readonly="readonly"> <input type="button"
							onclick="sample3_execDaumPostcode()" value="우편번호 찾기"><br></td>
					</tr>
					<!--name속성 달아줘야 하고, 이비 만들어서 넣어줄것 생각하기 -->
					
					<tr>
						<td><input type="text" id="sample3_address" placeholder="주소" style="width:400px;" readonly="readonly">
							<input type="text" id="sample3_detailAddress" placeholder="상세주소" style="width:400px;">
							<input type="text" id="sample3_extraAddress" placeholder="참고항목" style="width:100px;" readonly="readonly">
							<br></td>
					</tr>
					<tr>
						<td><div style="display: inline-block; color:#F27500;'">*</div><div style="display: inline-block;">휴대전화</div></td>
						<td><input type="tel"></td>
					</tr>
					<tr>
						<td><div style="display: inline-block; color:#F27500;'">*</div><div style="display: inline-block;">이메일</div></td>
						<td><input type="email"></td>
					</tr>
					<tr>
						<td>배송메세지</td>
						<td><textarea rows="5" cols="5" style="width: 100%;"></textarea>
						</td>
					</tr>

				</table>

				<div id="findPostCode"
					style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
					<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
						id="btnFoldWrap"
						style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
						onclick="foldDaumPostcode()" alt="접기 버튼">
				</div>


				
				<h1 style="margin:30px auto;">약관동의</h1>
				<h1>비회원으로 들어갈 시 노출</h1>
			
				<table>
				
				<tr>
					<td colspan="2">(체크박스) 전체 동의
					</td>
				</tr>
				
				<tr>
					<td>
						<strong>쇼핑몰 이용약관</strong>
						<textarea rows="2" cols="80" readonly="readonly">쇼핑몰 이용약관 내용입니다. </textarea>
						<div>)체크박스)</div>
					</td>
					<td>
					<strong>비회원 구입시 정보이용 동의</strong>	
						<textarea rows="2" cols="80" readonly="readonly">비회원 구입시 정보이용 동의 내용입니다.</textarea>
						<div>)체크박스)</div>
					</td>
				</tr>
				
				</table>
		
		
		
		
		
		
		
		
		
		
		
				<h1 style="margin:30px auto;">결제 예정금액</h1>
				
				<table style="margin-bottom:100px; border: ">
				
				<tr>
					<td>
						총 주문 금액
					</td>
					<td>
						총 할인 + 부가 결제 금액
					</td>
					<td>
						총 결제 예정 금액
					</td>
				</tr>
				<tr>
					<td style="border: none;">
						배송비 합한 금액
					</td>
					<td style="border:none;">
						-붙여주는 금액
					</td>
					<td>
						총
					</td>
				</tr>
				<tr>
					<td>
						적립금
					</td>
					<td colspan="5">
						<input type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"> 원 (총 사용 가능 적립금:(멤버에서 받아오는 적립금) 원)

					</td>
				
				</tr>
				
				
				</table>
				

				 <button class="button_base b01_simple_rollover" onclick="requestPay()">결제하기</button> 


			</div>
			<!-- footer -->
			<c:import url="../template/footer.jsp"></c:import>
		</div>
	</div>
</body>
<!------------------------------- CSS & JavaScript -------------------------------------->
<link rel="stylesheet" href="../resources/css/common.css">
<script type="text/javascript" src="../resources/js/common.js"></script>
<script type="text/javascript" src="../resources/js/main.js"></script>
<script type="text/javascript" src="../resources/jquery/dropdown.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	// 우편번호 찾기 찾기 화면을 넣을 element
	var element_wrap = document.getElementById('findPostCode');

	function foldDaumPostcode() {
		// iframe을 넣은 element를 안보이게 한다.
		element_wrap.style.display = 'none';
	}

	function sample3_execDaumPostcode() {
		// 현재 scroll 위치를 저장해놓는다.
		var currentScroll = Math.max(document.body.scrollTop,
				document.documentElement.scrollTop);
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample3_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample3_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample3_postcode').value = data.zonecode;
						document.getElementById("sample3_address").value = addr;
					
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample3_detailAddress")
								.focus();

						// iframe을 넣은 element를 안보이게 한다.
						// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
						element_wrap.style.display = 'none';

						// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
						document.body.scrollTop = currentScroll;
					},
					// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
					onresize : function(size) {
						element_wrap.style.height = size.height + 'px';
					},
					width : '100%',
					height : '100%'
				}).embed(element_wrap);

		// iframe을 넣은 element를 보이게 한다.
		element_wrap.style.display = 'block';
	}
</script>

<!-- 결제 api -->
<!-- jQuery -->
<!--   <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> -->
  <!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">

var IMP = window.IMP; // 생략해도 괜찮습니다.
IMP.init("imp92233315"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.


function requestPay(){ 
// IMP.request_pay(param, callback) 호출
IMP.request_pay({
    pg : 'html5_inicis',
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(), //주문번호
    name : $("#productName").text(),
    amount :  100, //가격
    buyer_email : 'iamport@siot.do',
    buyer_name : '구매자이름',
    buyer_tel : '010-1234-5678',
    buyer_addr : '서울특별시 강남구 삼성동',
    buyer_postcode : '123-456'
}, function(rsp) {
    if ( rsp.success ) {
    	
    	
    	
        $.ajax({
        	type:'post',
            url: "./payments/complete", // 가맹점 서버
            
            headers: { "Content-Type": "application/json" },
            data: {
                imp_uid: rsp.imp_uid,
                merchant_uid: rsp.merchant_uid
            }
        }).done(function (data) {
          // 가맹점 서버 결제 API 성공시 로직
        })
    	
    	
    	
    	
 /*        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num; */
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
    }

    alert(msg);
});
 } 
</script>  


</html>
