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
							
							<td>배송</td>
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
							<td id="productAmount">${dto.amount}</td>
						
							<td  >일반 배송</td>
							<td id="totalP" >배송비 뺀 합계</td>
						</tr>
						<tr>
							<td colspan="4" style="text-align:right;">총 결제 금액</td>
							<td  style="text-align:right;" id="shipping">배송비</td>
							<td  style="text-align:right;" id="totalPrice">총합계</td>
						</tr>

					</tbody>

				</table>
				<input type="hidden" value="${dto.productNum}" id="productNum">
				<input type="hidden" value="${member.id}" id="mId">
				

				
				
				
				
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
						<td><input type="text" id="receiver"><br></td>
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
						<td><input id="tel" type="tel"></td>
					</tr>
					<tr>
						<td><div style="display: inline-block; color:#F27500;'">*</div><div style="display: inline-block;">이메일</div></td>
						<td><input id="email" type="email"></td>
					</tr>
					<tr>
						<td>배송메세지</td>
						<td><textarea id="orderMessage" rows="5" cols="5" style="width: 100%;"></textarea>
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





				<c:if test="${empty member}">
				
				<h1 style="margin:30px auto;">약관동의</h1>
			
			
				<table>
				
				<tr>
					<td colspan="2">(체크박스) 전체 동의
					</td>
				</tr>
				
				<tr>
					<td>
						<strong>쇼핑몰 이용약관</strong>
						<textarea rows="2" cols="80" readonly="readonly">제1조(목적)이 약관은 shs가 운영하는 아웃오브라인 스토어(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리.의무 및 책임사항을 규정함을 목적으로 합니다.※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」제2조(정의)① “몰”이란 아웃 오브 라인이 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.제3조 (약관 등의 명시와 설명 및 개정) ① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호.모사전송번호.전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보보호책임자등을 이용자가 쉽게 알 수 있도록 아웃오브라인 스토어의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회.배송책임.환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 “몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. ⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.제4조(서비스의 제공 및 변경) ① “몰”은 다음과 같은 업무를 수행합니다.  1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결  2. 구매계약이 체결된 재화 또는 용역의 배송  3. 기타 “몰”이 정하는 업무② “몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.제5조(서비스의 중단) ① “몰”은 컴퓨터 등 정보통신설비의 보수점검.교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.② “몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.제6조(회원가입) ① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.② “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.  1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.  2. 등록 내용에 허위, 기재누락, 오기가 있는 경우  3. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우③ 회원가입계약의 성립 시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “몰”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.제7조(회원 탈퇴 및 자격 상실 등) ① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.② 회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.  1. 가입 신청 시에 허위 내용을 등록한 경우  2. “몰”을 이용하여 구입한 재화 등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우  3. 다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우  4. “몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우③ “몰”이 회원 자격을 제한.정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다.④ “몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.제8조(회원에 대한 통지)① “몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.② “몰”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “몰” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.제9조(구매신청) ① “몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.  1. 재화 등의 검색 및 선택  2. 받는 사람의 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력  3. 약관내용, 청약철회권이 제한되는 서비스, 배송료.설치비 등의 비용부담과 관련한 내용에 대한 확인  4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)  5. 재화등의 구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의  6. 결제방법의 선택② “몰”이 제3자에게 구매자 개인정보를 제공·위탁할 필요가 있는 경우 실제 구매신청 시 구매자의 동의를 받아야 하며, 회원가입 시 미리 포괄적으로 동의를 받지 않습니다. 이 때 “몰”은 제공되는 개인정보 항목, 제공받는 자, 제공받는 자의 개인정보 이용 목적 및 보유·이용 기간 등을 구매자에게 명시하여야 합니다. 다만 「정보통신망이용촉진 및 정보보호 등에 관한 법률」 제25조 제1항에 의한 개인정보 처리위탁의 경우 등 관련 법령에 달리 정함이 있는 경우에는 그에 따릅니다.제10조 (계약의 성립)① “몰”은 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.  1. 신청 내용에 허위, 기재누락, 오기가 있는 경우  2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우  3. 기타 구매신청에 승낙하는 것이 “몰” 기술상 현저히 지장이 있다고 판단하는 경우② “몰”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.③ “몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.제11조(지급방법)“몰”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법중 가용한 방법으로 할 수 있습니다. 단, “몰”은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체 2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제3. 온라인무통장입금4. 전자화폐에 의한 결제5. 수령 시 대금지급6. 마일리지 등 “몰”이 지급한 포인트에 의한 결제7. “몰”과 계약을 맺었거나 “몰”이 인정한 상품권에 의한 결제 8. 기타 전자적 지급 방법에 의한 대금 지급 등제12조(수신확인통지.구매신청 변경 및 취소)① “몰”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 “몰”은 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.제13조(재화 등의 공급)① “몰”은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, “몰”이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다. 이때 “몰”은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.② “몰”은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “몰”이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “몰”이 고의.과실이 없음을 입증한 경우에는 그러하지 아니합니다.제14조(환급)“몰”은 이용자가 구매신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.제15조(청약철회 등)① “몰”과 재화등의 구매에 관한 계약을 체결한 이용자는 「전자상거래 등에서의 소비자보호에 관한 법률」 제13조 제2항에 따른 계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다 재화 등의 공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터 7일 이내에는 청약의 철회를 할 수 있습니다. 다만, 청약철회에 관하여 「전자상거래 등에서의 소비자보호에 관한 법률」에 달리 정함이 있는 경우에는 동 법 규정에 따릅니다. ② 이용자는 재화 등을 배송 받은 경우 다음 각 호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.  1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)  2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우  3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우  4. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우③ 제2항제2호 내지 제4호의 경우에 “몰”이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.제16조(청약철회 등의 효과)① “몰”은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 “몰”이 이용자에게 재화등의 환급을 지연한때에는 그 지연기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」제21조의2에서 정하는 지연이자율(괄호 부분 삭제)을 곱하여 산정한 지연이자를 지급합니다.② “몰”은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.③ 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은 이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 “몰”이 부담합니다.④ 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 “몰”은 청약철회 시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.제17조(개인정보보호)① “몰”은 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다. ② “몰”은 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.③ “몰”은 이용자의 개인정보를 수집·이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. ④ “몰”은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용·제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.⑤ “몰”이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보보호 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.⑥ 이용자는 언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “몰”은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “몰”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.⑦ “몰”은 개인정보 보호를 위하여 이용자의 개인정보를 처리하는 자를 최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.⑧ “몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.⑨ “몰”은 개인정보의 수집·이용·제공에 관한 동의란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집·이용·제공에 관한 이용자의 동의거절시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집·이용·제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.제18조(“몰“의 의무)① “몰”은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화.용역을 제공하는데 최선을 다하여야 합니다.② “몰”은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.③ “몰”이 상품이나 용역에 대하여 「표시.광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시.광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.④ “몰”은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.제19조(회원의 ID 및 비밀번호에 대한 의무)① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “몰”에 통보하고 “몰”의 안내가 있는 경우에는 그에 따라야 합니다.제20조(이용자의 의무)이용자는 다음 행위를 하여서는 안 됩니다.1. 신청 또는 변경시 허위 내용의 등록2. 타인의 정보 도용3. “몰”에 게시된 정보의 변경4. “몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시5. “몰” 기타 제3자의 저작권 등 지적재산권에 대한 침해6. “몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위제21조(연결“몰”과 피연결“몰” 간의 관계)① 상위 “몰”과 하위 “몰”이 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 “몰”(웹 사이트)이라고 하고 후자를 피연결 “몰”(웹사이트)이라고 합니다.② 연결“몰”은 피연결“몰”이 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결“몰”의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.제22조(저작권의 귀속 및 이용제한)① “몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”몰“에 귀속합니다.② 이용자는 “몰”을 이용함으로써 얻은 정보 중 “몰”에게 지적재산권이 귀속된 정보를 “몰”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.③ “몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.제23조(분쟁해결)① “몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치.운영합니다.② “몰”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.③ “몰”과 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.제24조(재판권 및 준거법)① “몰”과 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.② “몰”과 이용자 간에 제기된 전자상거래 소송에는 한국법을 적용합니다.부 칙(시행일) 이 약관은 년 월 일부터 시행합니다.
부 칙(시행일) 이 약관은 년 월 일부터 시행합니다.			 </textarea>
						<div>)체크박스)</div>
					</td>
					<td>
					<strong>비회원 구입시 정보이용 동의</strong>	
						<textarea rows="2" cols="80" readonly="readonly">1. 개인정보 수집목적 및 이용목적 : 비회원 구매 서비스 제공2. 수집하는 개인정보 항목- 주문 시, 성명, 주소, 전화번호, 이메일, 결제정보, 비회원 결제 비밀번호- 취소/교환/반품 신청 시, 환불계좌정보(은행명, 계좌번호, 예금주)3. 개인정보의 보유기간 및 이용기간원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.가. 회사 내부 방침에 의한 정보 보유 사유· 부정거래 방지 및 쇼핑몰 운영방침에 따른 보관 : OO년나. 관련 법령에 의한 정보보유 사유o 계약 또는 청약철회 등에 관한 기록-보존이유 : 전자상거래등에서의소비자보호에관한법률-보존기간 : 5년o 대금 결제 및 재화 등의 공급에 관한 기록-보존이유: 전자상거래등에서의소비자보호에관한법률-보존기간 : 5년 o 소비자 불만 또는 분쟁처리에 관한 기록-보존이유 : 전자상거래등에서의소비자보호에관한법률-보존기간 : 3년 o 로그 기록 -보존이유: 통신비밀보호법-보존기간 : 3개월※ 동의를 거부할 수 있으나 거부시 비회원 구매 서비스 이용이 불가능합니다.			</textarea>
						<div>)체크박스)</div>
					</td>
				</tr>
				
				</table>
		
				
				</c:if>
		
		
		
		
		
		
		
		
		
				<h1 style="margin:30px auto;">결제 예정금액</h1>
				
				<table style="margin-bottom:100px; border:none; ">
				
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
					<td style="border: none;" id="beforePrice">
						배송비 합한 금액
					</td>
					<td style="border:none;" id="discount">
						-0
					</td>
					<td id="finalPrice">
						총
					</td>
				</tr>
				<tr>
					<td>
						쿠폰
					</td>
					<td colspan="5">
						<input type="button" value="쿠폰조회" id="couponButton">

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
				<script type="text/javascript">
					
				if(parseInt($("#productPrice").text())>=100000){			
					$("#shipping").text("무료");
					$("#totalP").text(parseInt($("#productPrice").text())*parseInt($("#productAmount").text()));
					$("#totalPrice").text($("#totalP").text());
				}else{			
					$("#shipping").text("3000");
					$("#totalP").text(parseInt($("#productPrice").text())*parseInt($("#productAmount").text()));
					$("#totalPrice").text(parseInt($("#totalP").text())+3000);
				}
				
				$("#beforePrice").text($("#totalPrice").text());
				$("#finalPrice").text($("#beforePrice").text());//쿠폰 맥이면 바꿔줘야해
				$("#couponButton").click(function(){
					
					 let mId = $("#mId").val();
					window.open("./couponList?id="+mId,"WindowName","width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
 
					
				});
				
				</script>


<!-- <script type="text/javascript">

let totalp=0;
$(".productPrice").each(function(){
	totalp=parseInt($(this).text())+totalp;
});
alert(totalp);
if(totalp>=100000){
	$("#shipping").text("무료");
}else{
	$("#shipping").text("3000");
}

</script> -->



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




/* var muid='merchant_' + new Date().getTime() //주문번호 */


 




function requestPay(){ 
// IMP.request_pay(param, callback) 호출

if($("#receiver").val()=="" || $("#email").val()=="" || $("#sample3_address").val()=="" ||
		$("#sample3_postcode").val()=="" || $("#sample3_detailAddress").val()=="" || $("#tel").val()==""){
	alert("필수항목을 입력해주세요");
}
else{

IMP.request_pay({
    pg : 'html5_inicis',
    pay_method : 'card',
    merchant_uid : new Date().getTime(), //주문번호
    name : $("#productName").text(),
    amount : $("#finalPrice").text(),
    buyer_email :/* 'test@test.com' */$("#email").val(),
    buyer_name : /* '창이욱' */$("#receiver").val(),
    buyer_tel : /* '010-1234-2345' */ $("#tel").val(),
    buyer_addr : $("#sample3_address").val()+$("#sample3_extraAddress").val()+$("#sample3_detailAddress").val(),
    buyer_postcode : $("#sample3_postcode").val()
}, function(rsp) {
    if ( rsp.success ) {
    	
    
    	
    	
    	
        $.ajax({
       		type:'post',
            url: "../payment/pay", // 가맹점 서버
            data: {
               // imp_uid: rsp.imp_uid,
                merchant_uid: rsp.merchant_uid,
                name : rsp.name,
                amount : rsp.paid_amount, //결제된 가격
                buyer_email : rsp.buyer_email,
                buyer_name : rsp.buyer_name,
                buyer_tel : rsp.buyer_tel,
                buyer_addr : rsp.buyer_addr,
                buyer_postcode : rsp.buyer_postcode,
                productNum : $("#productNum").val(),
                orderMessage : $("#orderMessage").text(),
                count : $("#productAmount").text()
            }
        }).done(function (data) {
          // 가맹점 서버 결제 API 성공시 로직
          // 밑의 결제완료 메세지 이후 출력
        	alert("결제되었습니다.");	
          location.href="../payment/payInfo?orderNum="+rsp.merchant_uid;
        });
    	
 
 
        
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
        alert(msg);
    }

   
});
 } 
}
</script>  


</html>
