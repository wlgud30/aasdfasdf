<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script>
function go(){
	alert("hello")
	$("#frm").submit();
}
$(document).ready(function(){
	
})
</script>
<title>Insert title here</title>
</head>
<body>
<form id="frm" action="/UClub/excelJoin.techni" method="post">
	<input type="text" name="c_idx" id="c_idx"><button onclick="go()" id = "b1" type="button">버튼</button>
</form>
</body>
</html>