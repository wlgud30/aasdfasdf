<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function Member(){
	location.href="controller.do?command=Member"
};
function IdSearch(){
		var pop = window.open("IdSearch.jsp","pop","width=270,height=120, scrollbars=yes, resizable=yes"); 
};
function PwSearch(){
	var pop = window.open("PwSearch.jsp","pop","width=270,height=220, scrollbars=yes, resizable=yes");
};
</script>

</head>
<body>
<form action="controller.do" method="get">
	<input type = "hidden" name="command" value="login">
	<table border="1">
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pw"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="로그인">
				<input type="button" value="회원가입" onclick="Member();">
				<input type="button" value="ID찾기" onclick="IdSearch();">
				<input type="button" value="PW찾기" onclick="PwSearch();">
			</td>
		</tr>
	
	</table>
	</form>

</body>
</html>