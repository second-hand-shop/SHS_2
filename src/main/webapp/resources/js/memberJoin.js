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
			alert("회원가입 성공");
			$("#joinform").submit();
		} else {
			alert("입력 항목을 확인해주세요!");
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
		
	if(result=null){
		$("#pwResult").html("비밀번호를 입력하세요");
		$("#pwResult").removeClass("idCheck0").addClass("idCheck1");
	} else if(pw == pw2){
		$("#pwResult").html("비밀번호가 일치 합니다");
		$("#pwResult").removeClass("idCheck1").addClass("idCheck0");
		pwCheck=true;
	} else {
		$("#pwResult").html("비밀번호가 일치 하지 않습니다");
		$("#pwResult").removeClass("idCheck0").addClass("idCheck1");
	}
 });
	
	
//id 체크
$("#id").blur(function() {
	idCheck=false;
	var id = $(this).val();
	if(id != ''){
		$.get("./memberIdCheck?id="+id,function(data){
			data=data.trim();
			var str = "중복된 아이디 입니다";
			
			            
			$("#idResult").removeClass("idCheck0").addClass("idCheck1");
				if(data==1){
					str = "사용 가능한 ID 입니다"
					$("#idResult").removeClass("idCheck1").addClass("idCheck0");
					idCheck=true;
				}
				$("#idResult").html(str);
				
			});
	} else {
		$("#idResult").html("아이디는 필수 항목입니다");
		$("#idResult").removeClass("idCheck0").addClass("idCheck1");
	} 
});
