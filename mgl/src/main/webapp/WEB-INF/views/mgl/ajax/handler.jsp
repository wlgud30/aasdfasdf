<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script>
	var ua = navigator.userAgent
	var a = navigator.userAgent.indexOf("AL:");
	var b = navigator.userAgent.indexOf("ID:");
	var c = navigator.userAgent.indexOf("PW:")
	var d = navigator.userAgent.indexOf("TOKEN:")
	var gu = "${gubun}"
	if(d != -1 && a != -1 && gu == "" || gu == null){
		location.href='/Member/handler.techni?m_id='+ua.substr(b+3,c-b-3)+'&m_pw='+ua.substr(c+3)+'&c_idx=${c_idx}'
	}else if(d!= -1 && a != -1 && gu != ""){
		location.href=location.href='/Member/handler2.techni?m_id='+ua.substr(b+3,c-b-3)+'&m_pw='+ua.substr(c+3)+'&c_idx=${c_idx}'
	}else{
		location.href='/Member/LoginForm.techni'
	}
</script>
<body>

</body>
</html>