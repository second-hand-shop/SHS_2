/**
 * 
 */
function findId(){
    //querySelector :
    //   css선택자로 원하는 html element 객체를 불러온다.
    //  jquery의 $('')와 유사하다.
    console.log("클릭");

    var name = document.querySelector('#name').value;
    var email = document.querySelector('#email').value;
	$.ajax({
   type:"POST",
   url:"./memberIdFind",
   data:{
	   name:name,
   	   email:email   
	},
	success:function(data){
	if(data != ''){
           alert ( '회원님의 아이디는 ' + data + ' 입니다');
        } else {
            alert ('일치하는 정보가 없습니다');
        }
}
});
}