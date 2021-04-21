/**
 * 
 */
var idCheck=false;
var pwCheck=false;
var emptyCheckResult = true;

$("#join").click(function() {
emptyCheck();
		if(idCheck && pwCheck && emptyCheckResult){
			//중복체크했고, 사용가능한 ID
			$("#frm").submit();
		} else {
			alert("회원가입 실패");
		}			
});
	
//항목체크
function emptyCheck() {
	emptyCheckResult=true;
	$(".etcResult").removeClass("idCheck1");
	$(".etcResult").html('');
	$(".etc").each(function() {
		var data = $(this).val();
		if(data==''){
			emptyCheckResult=false;
			$(this).next().html("필수 항목입니다");
			$(".etcResult").addClass("idCheck1");
			}
		});
	}
	
//pw 체크
$("#pw2").blur(function() {
	var pw = $("#pw").val();
	var pw2 = $(this).val();
	pwCheck=false;
		
	if(pw2==''){
		$("#pwResult").html("Password를 입력하세요");
		$("#pwResult").removeClass("idCheck0").addClass("idCheck1");
	} else if(pw == pw2){
		$("#pwResult").html("Password가 일치 합니다");
		$("#pwResult").removeClass("idCheck1").addClass("idCheck0");
		pwCheck=true;
	} else {
		$("#pwResult").html("Password가 일치 하지 않습니다");
		$("#pwResult").removeClass("idCheck0").addClass("idCheck1");
	}
 });
	
	
//id 체크
$("#id").blur(function() {
	idCheck=false;
	var id = $(this).val();
	if(id != ''){
		$.get("./memberIdCheck?id="+id,function(data){
				//a 사용가능, b 사용불가
				//true 사용가능 false 사용불가
				//0 사용가능 	1 사용불가
			data=data.trim();
			var str = "중복된 ID 입니다";
				
			$("#idResult").removeClass("idCheck0").addClass("idCheck1");
			if(data==0){
				str = "사용 가능한 ID 입니다"
				$("#idResult").removeClass("idCheck1").addClass("idCheck0");
				idCheck=true;
			}
			$("#idResult").html(str);		
		});
	} else {
		$("#idResult").html("Id는 필수 항목입니다");
		$("#idResult").removeClass("idCheck0").addClass("idCheck1");
	}		
});