
$(function(){
	$("input").eq(3).focusout(function(){
		if($("input:eq(2)").val().length>=6&&$("input:eq(3)").val().length>=6){
			$("#a").removeAttr("disabled");
			if($("input:eq(2)").val()== $("input:eq(3)").val()){
			$(".pw").empty();
			$(".pw").append("<div class='ok'>비밀번호가 일치합니다.</div>")
		}else{
			$(".pw").empty();
			$(".pw").append("<div class='alert'>비밀번호가 일치하지 않습니다.</div>")
		}
			
	}else{
		$(".pw").empty();
		$(".pw").append("<div class='alert'>비밀번호의 길이가 짧습니다.</div>")
		$("#a").attr("disabled","disabled");
	}
	});
});

$(function(){
	//아이디체크
	$("input").eq(1).focusout(function(){
		//글자수 5글자 미만시 경고
		if($(this).val().length<6){
			$(".idchk").empty();
			$(".idchk").append("<div class='alert'>아이디는 6글자 이상 영어와 숫자로 이루어져있어야 합니다.</div>");
			$(this).val("");
		}else{
			//id가 소문자 &숫자로 이루어졌는지 check
			var name = $(this).val();
			var ok = true;
			for(var i=0;i<name.length;i++){
				var code = name.charCodeAt(i);
				if(!((97<=code&&code<=122)||(48<=code&&code<=57)||(65<=code&&code<=90))){
					ok=false;
					break;
				}
			}
			if(ok){
				//id가 영어&숫자이면 id 중복체크
				var url="controller.do?command=idchk&id="+$(this).val();
				httpRequest = new XMLHttpRequest();			//서버와 통신
				httpRequest.onreadystatechange=callback;	//처리할 함수
				httpRequest.open("GET",url,true);			//true:비동기/false:동기
				httpRequest.send();	
			}else{
				//id가 영어&숫자가 아닐때
				$(".idchk").empty();
				$(".idchk").append("<div class='alert'>아이디는 소문자/숫자로 이루어져야 합니다.</div>");
				$(this).val("");
			}
		}
	});
	
});
$(function(){
	//별명체크
	$("input").eq(5).focusout(function(){
		//글자수 2글자 미만시 경고
		if($(this).val().length<2){
			$(".nichk").empty();
			$(".nichk").append("<div class='alert'>별명은 특수문자를뺀 2글자 이상이여야합니다.</div>");
			$(this).val("");
		}else{
			//별명가 영어 한글 &숫자로 이루어졌는지 check
			var name = $(this).val();
			var ok = true;
			for(var i=0;i<name.length;i++){
				var code = name.charCodeAt(i);
				if(!((97<=code&&code<=122)||(48<=code&&code<=57)||(65<=code&&code<=90)||(44032<=code&&code<=55203))){
					ok=false;
					break;
				}
			}
			if(ok){
				//id가 영어&숫자이면 id 중복체크
				var url="controller.do?command=nichk&nikname="+$(this).val();
				httpRequest = new XMLHttpRequest();			//서버와 통신
				httpRequest.onreadystatechange=callback2;	//처리할 함수
				httpRequest.open("GET",url,true);			//true:비동기/false:동기
				httpRequest.send();	
			}else{
				//id가 영어&숫자가 아닐때
				$(".nichk").empty();
				$(".nichk").append("<div class='alert'>별명은 특수문자를뺀 2글자 이상이여야합니다.</div>");
				$(this).val("");
			}
		}
	});
	
});
$(function(){
	//아이디체크
	
	
	
	
	$("input").eq(11).focusout(function(){
		//글자수 5글자 미만시 경고
		if($(this).val().length<2){
			$(".emailchk").empty();
			$(".emailchk").append("<div class='alert'>이메일이 짧습니다.</div>");
			$(this).val("");
		}else{
			//id가 소문자 &숫자로 이루어졌는지 check
			var name = $(this).val();
			var ok = true;
			for(var i=0;i<name.length;i++){
				var code = name.charCodeAt(i);
				if(!((97<=code&&code<=122)||(48<=code&&code<=57)||(64<=code&&code<=90)||(46==code))){
					ok=false;
					break;
				}
			}
			if(ok){
				//id가 영어&숫자이면 id 중복체크
				var url="controller.do?command=emailchk&email="+$(this).val();
				httpRequest = new XMLHttpRequest();			//서버와 통신
				httpRequest.onreadystatechange=callback3;	//처리할 함수
				httpRequest.open("GET",url,true);			//true:비동기/false:동기
				httpRequest.send();	
			}else{
				//id가 영어&숫자가 아닐때
				$(".emailchk").empty();
				$(".emailchk").append("<div class='alert'>이메일은 영어/숫자로 이루어져야 합니다.</div>");
				$(this).val("");
			}
		}
	});
	
});













function callback(){
	if(httpRequest.readyState ==4){
		if(httpRequest.status==200){
			if(httpRequest.responseText.trim()=="ok"){
				$(".idchk").empty();
				$(".idchk").append("<div calss='ok'>사용 가능한 아이디입니다.</div>")
			}else{
				$(".idchk").empty();
				$(".idchk").append("<div class = 'alert'>아이디가 중복됩니다.</div>")
				$("input").eq(1).val("");
			}
		}
	}
}
function callback2(){
	if(httpRequest.readyState ==4){
		if(httpRequest.status==200){
			if(httpRequest.responseText.trim()=="ok"){
				$(".nichk").empty();
				$(".nichk").append("<div calss='ok'>사용 가능한 별명입니다.</div>")
			}else{
				$(".nichk").empty();
				$(".nichk").append("<div class = 'alert'>별명이 중복됩니다.</div>")
				$("input").eq(5).val("");
			}
		}
	}
}
function callback3(){
	if(httpRequest.readyState ==4){
		if(httpRequest.status==200){
			if(httpRequest.responseText.trim()=="ok"){
				$(".emailchk").empty();
				$(".emailchk").append("<div calss='ok'>사용 가능한 이메일 입니다.</div>")
			}else{
				$(".emailchk").empty();
				$(".emailchk").append("<div class = 'alert'>이메일이 중복됩니다.</div>")
				$("input").eq(11).val("");
			}
		}
	}
}