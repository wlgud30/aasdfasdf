<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");%>
<%@page import="com.login.dto.LoginDto"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


</head>
<body>
<h1>내 정보</h1>
<table border="1">
	<tr>
		<th>아이디</th>
		<td>${dto.id }</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>${dto.name }</td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td>${dto.nikname }</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>${dto.email }</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td>${dto.phone }</td>
	</tr>
	<tr>
		<th>주소</th>
		<td>${dto.addr }<br>${dto.subaddr }</td>
	</tr>
	<tr>
			<td colspan="2" >
				<button onclick="location.href='controller.do?command=updateOut&no=${dto.no}'">탈퇴</button>
				<button onclick="location.href='UserUpdate.jsp'">내 정보수정</button>
			</td>
	</tr>
	
</table>

</body>
</html>