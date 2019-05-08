<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page isErrorPage="true" %>
 <%response.setStatus(HttpServletResponse.SC_OK);%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>MGL</title>
</head>
<body>

에러코드 : ${status_code} <br>
에러타입 : ${exception_type} <br>
에러메세지 : ${message} <br>
응답 uri : ${request_uri} <br>
exception : ${exception} <br>
servlet_name : ${servlet_name} <br>
<button onclick="location.href='http://mgl.techni.co.kr:8081/'">돌아가기</button>
</body>
</html>