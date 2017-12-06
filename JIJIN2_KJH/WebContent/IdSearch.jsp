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

</script>
</head>
<body>
<form action="controller.do" method="get">
	<input type = "hidden" name="command" value="selectId">
	<table border="1">
		<tr>
			<th>이름</th>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="email" name="email"></td>
		</tr>
		<tr>
			<td colspan="1">
				<input type="submit" value="확인">
			</td>
		</tr>
	</table>
</form>

</body>
</html>