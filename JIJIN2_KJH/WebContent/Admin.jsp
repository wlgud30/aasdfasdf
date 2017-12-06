<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* 	response.setHeader("Cache-control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0"); */
	/*데이터가 변경 되었을때 이전 내용을 화면에 보여주는 이유
	ㅡ> 서버값이 아닌 캐시에 저장된 내용을 가져오기때문
	브라우저가 캐시에 응답 결과를 저장하지 않도록 설정
	
	response.setHeader("Cache-control", "no-store");	//http 1.1
	response.setHeader("Pragma", "no-cache");			//http 1.0
	response.setHeader("Expires", "0");					//proxt server
	 *
	 */
	 /**/
%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8");%>
<%@ page import = "com.login.dto.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	LoginDto dto = (LoginDto)session.getAttribute("dto");
if(dto ==null){
	pageContext.forward("Login.jsp");
}
%>
</head>
<body>
<div>
		<span>${ dto.name}님 환영합니다 (등급 : ${dto.grade})</span>
		<a href= "controller.do?command=logout">로그아웃</a>
	</div>
	<div>
		<div>
			<a href="controller.do?command=UserList">회원 정보 조회(all)</a>
		</div>
	</div>

</body>
</html>
