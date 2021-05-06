/**
 * 
 */

let btn = document.getElementById("btn");
let boardPw = document.getElementById("boardPw");

btn.addEventListener("click", function(){
	//조건이 만족하면 서버로 보내고 만족하지 않으면 보내지않음.
	
	if(boardPw.value == "" && boardPw.value != getPw.value){
		alert("pw를 입력하지 않았거나 값이 올바르지 않습니다.");
		//focus를 사용해서 입력하지 않았거나, 올바르지 않은 정보 입력 시 해당 input칸으로 이동
		boardPw.focus();
	}
	
});



    $('#btn').click(function() {
        $.ajax({
            url:'../comments/commentsResult.jsp',
            type:'GET',
            dataType: 'text',
            success: function(data){
            	$('#dictionary').html(data);
            }// end
        });// end ajax
        return false;
    });
