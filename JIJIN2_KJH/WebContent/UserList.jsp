<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js">
</script>
<script type="text/javascript">
$(function(){
	if($("div:eq(0)").text()=="탈퇴"){
		$("select:eq(0)").disabled;
	}
});
</script>
</head>
<body>
<h1>회원 정보 조회</h1>
<form action = "controller.do" method="post">
	<input type = "hidden" name= "command" value="updateGrade">
	<input type = "hidden" name = "no" value="${dto.no}">
	<input type = "hidden" name = "grade" value="${dto.grade}">
		
	<table border="1">
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>닉네임</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>상세주소</th>
			<th>가입여부</th>
			<th>회원탈퇴날짜</th>
			<th>등급</th>
			<th>등급변경</th>
		</tr>
		<c:forEach items="${list }" var = "dto">
			<tr>
				<td>${dto.no }</td>
				<td>${dto.id }</td>
				<td>${dto.pw }</td>
				<td>${dto.name }</td>
				<td>${dto.nikname }</td>
				<td>${dto.email }</td>
				<td>${dto.phone }</td>
				<td>${dto.addr }</td>
				<td>${dto.subaddr }</td>
				<td><div>${dto.enabled eq ("Y")?"가입":"탈퇴"}</div></td>
				<td>${dto.lastdate }</td>
				<td>${dto.grade }</td>
				<td>
					<div>
						<select name = "grade" ${dto.enabled eq ("Y")?"":"disabled"} >
							<option value = "ADMIN" ${dto.grade eq ("ADMIN")?"selected":""} >관리자</option>
							<option value = "MANAGER" ${dto.grade eq ("MANAGER")?"selected":""} >매니저</option>
							<option value = "USER" ${dto.grade eq ("USER")?"selected":""} >일반회원</option>
						</select>
					</div>
				</td>
				
			</tr>
		</c:forEach>
				<tr>
					<td colspan="13">
						<input type = "submit" value ="변경완료">
					</td>
				</tr>
	</table>
</form>
</body>
</html>