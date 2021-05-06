/**
 * 
 */

let btn = document.getElementById("btn");
let writer = document.getElementById("writer");
let title = document.getElementById("title");
let contents = document.getElementById("contents");
let boardPw = document.getElementById("boardPw");

btn.addEventListener("click", function(){
	//조건이 만족하면 서버로 보내고 만족하지 않으면 보내지않음.
	
	let form = document.getElementById("form");
	
	if(writer.value == ""){
		alert("writer를 입력하지 않았습니다!");
		//focus를 사용해서 입력하지 않았거나, 올바르지 않은 정보 입력 시 해당 input칸으로 이동
		writer.focus();
	} else if(title.value == ""){
		alert("title을 입력하지않았습니다!");
		title.focus();
	} else if(contents.value == ""){
		alert("contents를 입력하지않았습니다!");
		contents.focus();
	} else if(boardPw.value == ""){
		alert("pw를 입력하지않았습니다!");
		boardPw.focus();
	} else if(writer.value != "" && title.value != "" && contents.value != "" && boardPw.value != ""){
		form.submit(); 
	}
	
});