/**
 * 
 */

//id check 결과
let idCheckResult = false;
//pw check 결과
let pwCheckResult = false;
//pw 비교 결과
let pwEqualResult = false;
//name, phone, email 결과
let etcResult = true;

//1. id길이 (4~16자)
let id = document.getElementById("id");
id.addEventListener("blur", function(){
	let message ="4글자 미만입니다.";
});

let btn = document.getElementById("btn");
btn.addEventListener("click", function(){
	
});