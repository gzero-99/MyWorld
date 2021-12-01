function CheckAddMusic(){
	
	var musicId = document.getElementById("musicId");
	var name = document.getElementById("name");
	var price = document.getElementById("price");
	
	//음악 아이디 체크
	if(!check(/^MCD[0-9]{4,11}$/, musicId,
	"[음악 아이디]\nMCD와 숫자를 조합하여 5~12자까지 입력하세요\n첫 글자는 반드시 MCD으로 시작하세요"))
		return false;
	//음악 제목 체크 
	if(name.value.length < 0){
		alert("[음악 제목]\n최소 1자는 입력하세요");
		name.select();
		name.focus();
		return false;
	}
	
	//음악 가격 체크
	if(price.value.length == 0 || isNaN(unitPrice.value)){
		alert("[가격]\n숫자만 입력하세요");		
		unitPrice.select();
		unitPrice.focus();
		return false;
	}
	if(price.value < 0){
		alert("[가격]\n에 음수를 입력할 수 없습니다.");
		unitPrice.select();
		unitPrice.focus();
		return false;
	} 
	
	function check(regExp, e,msg){
		
		if(regExp.test(e.value)){
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}
	document.newMusic.submit();
}

function CheckAddForum(){
	var title = document.getElementById("title");
	var time = document.getElementById("time");
	var content = document.getElementById("content");
	
	if(title.value.length < 0){
		alert("[글 제목]\n최소 1자는 입력하세요");
		title.select();
		title.focus();
		return false;
	}
	if(time.value.length < 0){
		alert("[날짜 및 시간]\n날짜 및 시간을 입력하세요");
		title.select();
		title.focus();
		return false;
	}
	if(content.value.length < 0){
		alert("[글 내용]\n글의 내용을 입력하세요");
		content.select();
		content.focus();
		return false;
	}
	document.newForum.submit();
}