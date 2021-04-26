/**
 * 
 */
let check = document.getElementsByClassName("check");
let all = document.getElementById("all");
const btn = document.getElementById("btn");

btn.addEventListener("click", function(){
	if(all.checked){
		location.href="./memberJoin";
	}else {
		alert("약관 동의는 필수 입니다");
	}
});

all.addEventListener("click", function(){
	for(let ch of check){
		ch.checked=all.checked;
	}
});

for(let ch of check){
	ch.addEventListener("click",function(){
		
		let result = true;
		for(let c of check){
			if(!c.checked){
				result=false;
				break;
			}
		}
		all.checked=result;		
	});
}