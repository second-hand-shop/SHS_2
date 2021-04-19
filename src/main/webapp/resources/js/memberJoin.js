/**
 * 
 */

let id = document.getElementById("id");
let pw = document.getElementById("pw");
let pw2 = document.getElementById("pw2");
let btn = document.getElementById("btn");
let idCheck = document.getElementById("idCheck");
let etc = document.getElementsByClassName("etc");

//id check 결과
let idCheckResult = false;
//pw check 결과
let pwCheckResult = false;
//pw 비교 결과
let pwEqualResult = false;
//name, phone, email 결과
let etcResult = true;

//1. id길이 (4~16자)
id.addEventListener("blur", function(){
	let message ="4글자 미만입니다.";
	let c ="r1";
	if(id.value.length>3){
		message ="4글자 이상입니다.";
		c ="r2";
		idCheckResult = true;
	} 
	let idResult = document.getElementById("idResult");
	idResult.innerHTML = message;
	idResult.setAttribute("class",c);
});

//2. pw 길이 (10~16자)
pw.addEventListener("blur", function(){
	let message ="10글자 미만입니다.";
	if(pw.value.length>9){
		message="10글자 이상입니다.";
		c="r2";
		pwCheckResult = true;
	}
	let pwResult = document.getElementById("pwResult");
	pwResult.innerHTML = message;
	pwResult.setAttribute("class",c);
});

//3. pw와 pw2가 같은지 비교
pw2.addEventListener("blur", function(){
	if(pw.value != pw2.value){
		pw2.value="";
	}else {
		pwEqualResult=true;
	}
});

pw.addEventListener("change", function(){
	pw2.value="";
});

//4. id 중복확인
//$("#id").blur(function(){
idCheck.addEventListener("click", function(){
	let id=$("#id").val();
	$.get("./memberIdCheck?id="+id, function(result){
		result = result.trim();
		//let str ="사용가능한 ID입니다.";
		
		if(result=='0'){
			alert("사용가능한 아이디입니다.");
		} else if(result =='1'){
			alert("중복된 아이디입니다.");
		}
		//$("idCheckResult").html(str);
	});
});


//5. btn클릭시 join
btn.addEventListener("click", function(){
	for(let e of etc){
		if(e.value == ""){
			etcResult=false;
			break;
		}
	}
	//조건 만족하면 submit 강제실행
	if(idCheckResult && pwCheckResult && pwEqualResult && etcResult){
		let joinform = document.getElementById("joinform");
		/*joinform.submit();*/
		alert("회원가입 진행");
	} else {
		alert("필수 항목을 입력하세요");
	}
});