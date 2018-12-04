<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<title>MGL</title>
<link rel="stylesheet" href="/resources/css/login.css?ver3" type="text/css"/>
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/js/js_st.js?ver1"></script>
<script src="/resources/js/jquery.form.min.js"></script>
<script src="/resources/js/Navi.js?ver1"></script>
<script src="/resources/js/sweetalert.min.js"></script>
<link rel="stylesheet" href="/resources/css/prettydropdowns.css?ver2" type="text/css" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<script src="/resources/js/jquery.prettydropdowns.js?ver2"></script>
</head>
<body>
	<form id="frm" method="post">
		<input type="hidden" name="m_push" id="m_push">
		<input type="hidden" name="m_id" <c:if test="${m_id ne null }">value="${m_id}"</c:if>> 
		<input type="hidden" name="m_pw">
	</form>
<script type="text/javascript">
	$(document).ready(function(){
		var s = navigator.userAgent
		var c = navigator.userAgent.indexOf("TOKEN:")
		var a = navigator.userAgent.indexOf("AL:");
		if(c != -1){
			if(a != -1){
				$("#m_push").val(navigator.userAgent.substr(c+6,a-c-6));
			}else{
				$("#m_push").val(navigator.userAgent.substr(c+6,s.length));
			}	
		}
		$("#frm").attr("action", "/Member/Login.techni").submit();
	});
</script>
</body>
</html>
