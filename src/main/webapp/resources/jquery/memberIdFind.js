/**
 * 
 */
function findId(){
	var name = document.getElementById("name").value;
	var email = document.getElementById("email").value;
	var idFindResult = document.getElementById("idFindResult");
	
	$.ajax({
			type : "POST", // POST 방식으로
			url : "./memberIdFind",
			data : {"name" : name, "email" : email},
			// 성공 시
			success:function(data){
			if(data != ''){
           		alert ( '회원님의 아이디는 ' + ${dto.id} + ' 입니다');
        	} else {
           		 alert ('일치하는 정보가 없습니다');
       			}	
			}, 
			// 실패 시
			error : function(){
				alert("실패");
				}
			});
		} 		