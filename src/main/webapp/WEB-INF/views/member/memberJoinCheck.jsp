<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.info{
	width: 80%;
	margin: auto;
}
.button{
   margin:0 auto;
   width: 250px;
   flex-flow: row;
}
</style>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="../template/header.jsp"></c:import>
		</div>
		<!-- header END -->
		
	<div class="info">
		<div class="jumbotron">
			<h1>제1조(목적)</h1>
			<p>이 약관은 아웃 오브 라인이 운영하는 아웃오브라인 스토어(이하 “몰”이라 한다)에서 제공하는 인터넷 관련
			서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리.의무 및 책임사항을 규정함을 목적으로 합니다.
			※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」 제2조(정의) ①
			“몰”이란 아웃 오브 라인이 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를
			이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도
			사용합니다. ② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
			③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.
			④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다. 제3조 (약관 등의 명시와
			설명 및 개정) ① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는
			곳의 주소를 포함), 전화번호.모사전송번호.전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보보호책임자등을 이용자가
			쉽게 알 수 있도록 아웃오브라인 스토어의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을
			통하여 볼 수 있도록 할 수 있습니다. ② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중
			청약철회.배송책임.환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여
			이용자의 확인을 구하여야 합니다. ③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」,
			「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」,
			「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다. ④
			“몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터
			적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을
			두고 공지합니다. 이 경우 “몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. ⑤
			“몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에
			대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는
			뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다. ⑥
			이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에
			관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.</p>
			<br>
			<div class="form-check">
				<label class="form-check-label"> 
					<input type="checkbox" class="form-check-input check" value="">동의
				</label>
			</div>
		</div>

		<div class="jumbotron">
			<h1>1. 개인정보 수집목적 및 이용목적</h1>
			<p>가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공 , 구매 및 요금 결제 ,
			물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스 나. 회원 관리 회원제 서비스 이용에 따른 본인확인 ,
			개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보
			수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리 , 고지사항 전달 2. 수집하는 개인정보 항목 : 이름 ,
			생년월일 , 성별 , 로그인ID , 비밀번호 , 자택 전화번호 , 휴대전화번호 , 이메일 , 14세미만 가입자의 경우
			법정대리인의 정보 3. 개인정보의 보유기간 및 이용기간 원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를
			지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다. 가. 회사 내부 방침에 의한
			정보 보유 사유 o 부정거래 방지 및 쇼핑몰 운영방침에 따른 보관 : OO년 나. 관련 법령에 의한 정보보유 사유 o 계약
			또는 청약철회 등에 관한 기록 -보존이유 : 전자상거래등에서의소비자보호에관한법률 -보존기간 : 5년 o 대금 결제 및 재화
			등의 공급에 관한 기록 -보존이유: 전자상거래등에서의소비자보호에관한법률 -보존기간 : 5년 o 소비자 불만 또는 분쟁처리에
			관한 기록 -보존이유 : 전자상거래등에서의소비자보호에관한법률 -보존기간 : 3년 o 로그 기록 -보존이유: 통신비밀보호법
			-보존기간 : 3개월 ※ 동의를 거부할 수 있으나 거부시 회원 가입이 불가능합니다.</p>
			<br>
			<div class="form-check">
				<label class="form-check-label"> 
					<input type="checkbox" class="form-check-input check" value="">동의
				</label>
			</div>
		</div>
	</div>
	
	<div class="button">
		<div class="form-check">
			<label class="form-check-label"> 
				<input type="checkbox"	class="form-check-input check" id="all" value="">모두 동의
			</label>
		</div>
		<br>
		<button class="btn btn-dark" id="btn">JOIN</button>
	</div>
		<!-- footer -->
		<c:import url="../template/footer.jsp"></c:import>
	</div>
</body>
<!------------------------------- CSS & JavaScript -------------------------------------->
<link rel="stylesheet" href="../resources/css/common.css">
<script type="text/javascript" src="../resources/js/common.js"></script>
<script type="text/javascript" src="../resources/js/main.js"></script>
<script type="text/javascript" src="../resources/jquery/dropdown.js"></script>
<script type="text/javascript" src="../resources/jquery/memberJoinCheck.js"></script>
</html>