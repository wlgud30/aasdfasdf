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

�����ڵ� : ${status_code} <br>
����Ÿ�� : ${exception_type} <br>
�����޼��� : ${message} <br>
���� uri : ${request_uri} <br>
exception : ${exception} <br>
servlet_name : ${servlet_name} <br>
<button onclick="location.href='http://mgl.techni.co.kr:8081/'">���ư���</button>
</body>
</html>